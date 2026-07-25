-- mods/inventory/init.lua
-- Inventario del game monastyr: fornisce 5 pagine costruite sul
-- framework moninv:
--
--   inventory:survival   -- visibile sempre (sopravvivenza: solo HUD + craft 2x2)
--   inventory:all        -- visibile solo se il player e' "creative"
--   inventory:nodes      -- idem
--   inventory:tools      -- idem
--   inventory:craftitems -- idem
--
-- Regola per considerare un player "creative":
--   * ha il privilege 'creative' concesso manualmente, OPPURE
--   * il motore e' in creative mode (spunta nel menu' del mondo, oppure
--     enable_creative = true sul server).
-- In particolare:
--   * singleplayer survival + /grantme creative -> vede l'inventario creative
--   * singleplayer creative (spunta attiva)   -> vede l'inventario creative
--   * admin del server                        -> vede sempre l'inventario creative
--   * player normale su server creative       -> vede l'inventario creative
--   * player normale su server survival       -> vede l'inventario survival
--
-- I giocatori "creative" aprono l'inventario sulla pagina 'inventory:all'.
-- Gli altri aprono sulla pagina 'inventory:survival'.
--
-- Testi localizzati tramite il sistema di traduzione di Minetest.
local S = minetest.get_translator("inventory")

-- ============================================================
-- Stato per-giocatore
-- ============================================================
-- player_state[name] = { size, filter, start_i, old_filter, old_content }
-- Serve a tracciare la paginazione e il filtro di ricerca nelle pagine
-- creative. Nelle pagini survival/crafting non viene usato.
local player_state = {}

-- ============================================================
-- Helper: il player e' in modalita' creative?
-- ============================================================
-- Restituisce true se:
--   * ha il privilege 'creative' concesso manualmente (es. /grantme creative
--     in singleplayer, oppure /grant creative Nome su un server), OPPURE
--   * il motore e' in creative mode (spunta "Creative Mode" del mondo in
--     singleplayer, oppure enable_creative = true sul server).
-- In questo modo il giocatore apre l'inventario creative-like anche solo
-- per la sessione corrente se ha eseguito /grantme creative.
local function is_player_creative(name)
	if minetest.check_player_privs(name, {creative = true}) then
		return true
	end
	return minetest.is_creative_enabled(name)
end

-- ============================================================
-- Cache degli item, raggruppati per categoria
-- ============================================================
-- group_cache.all        -- tutti gli item che hanno una descrizione
-- group_cache.nodes      -- nodi
-- group_cache.tools      -- tool
-- group_cache.craftitems -- craftitem
-- Viene popolata DOPO che tutte le mod hanno registrato i loro item
-- (vedi register_on_mods_loaded in fondo).
local group_cache = {}

-- Costruisce (o ricostruisce) la cache degli item.
local function rebuild_group_cache()
	group_cache = {
		all = {},
		nodes = {},
		tools = {},
		craftitems = {},
	}
	for name, def in pairs(minetest.registered_items) do
		-- Salta gli item che non devono comparire nell'inventario
		if (def.groups and def.groups.not_in_creative_inventory == 1)
				or not def.description or def.description == "" then
			-- skip
		else
			local g = def.groups or {}
			local nogroup = not (g.node or g.tool or g.craftitem)
			if g.node or (nogroup and minetest.registered_nodes[name]) then
				group_cache.nodes[name] = def
			elseif g.tool or (nogroup and minetest.registered_tools[name]) then
				group_cache.tools[name] = def
			elseif g.craftitem
					or (nogroup and minetest.registered_craftitems[name]) then
				group_cache.craftitems[name] = def
			end
			-- L'item entra comunque nella categoria "all"
			group_cache.all[name] = def
		end
	end
end

-- ============================================================
-- Inventari "staccati" per-giocatore
-- ============================================================
-- Crea l'inventario detached "inventory_<name>" (da cui si possono
-- prelevare gli item se il giocatore ha il privilege 'inventory')
-- e il cestino "trash_<name>" per buttare gli item indesiderati.
local function ensure_player_inventory(player_name)
	if player_state[player_name] then
		return
	end

	player_state[player_name] = {
		size = 0,
		filter = "",
		start_i = 0,
		old_filter = nil,
		old_content = nil,
	}

	-- Cestino: accetta l'oggetto e lo scarta subito
	local trash = minetest.create_detached_inventory("trash_" .. player_name, {
		allow_put = function(_inv, _list, _idx, stack, _player)
			return stack:get_count()
		end,
		on_put = function(inv, listname)
			inv:set_list(listname, {})
		end,
	})
	trash:set_size("main", 1)

	-- Inventario principale: si puo' SOLO prelevare, e solo con il
	-- privilege 'inventory'.
	minetest.create_detached_inventory("inventory_" .. player_name, {
		allow_move = function(_inv, _from_list, _from_index, to_list,
				_to_index, count, player)
			-- Vietato spostare oggetti verso l'inventario principale del player
			if to_list == "main" then
				return 0
			end
			return count
		end,
		allow_put = function()
			return 0
		end,
		allow_take = function(_inv, _list, _idx, stack, player)
			if not player then
				return 0
			end
			-- Solo i player "creative" possono prelevare
			if not is_player_creative(player:get_player_name()) then
				return 0
			end
			return -1
		end,
	}, player_name)
end

-- ============================================================
-- Filtro e paginazione per le pagine creative
-- ============================================================

-- Restituisce un punteggio di match: 0 (match perfetto) .. NO_MATCH (non match).
-- Piu' basso = match migliore (per ordinare i risultati della ricerca).
local NO_MATCH = 999
local function match(s, filter)
	if filter == "" then
		return 0
	end
	if s:lower():find(filter, 1, true) then
		return #s - #filter
	end
	return NO_MATCH
end

-- Prima riga della descrizione (le descrizioni multiriga hanno '\n' interno)
local function first_line(s)
	return (s or ""):gsub("\n.*", "")
end

-- Aggiorna la lista "main" dell'inventario detached di un giocatore
-- in base alla tab e al filtro corrente. Aggiorna anche st.size.
local function update_list(player_name, tab_content)
	local st = player_state[player_name]
	if not st then
		return
	end

	-- Cache del risultato: se filtro e tab non sono cambiati, non rifare nulla
	if st.filter == st.old_filter and tab_content == st.old_content then
		return
	end
	st.old_filter = st.filter
	st.old_content = tab_content

	local items = group_cache[tab_content] or group_cache.all or {}
	local list, order = {}, {}
	for name in pairs(items) do
		local m = match(first_line(items[name].description), st.filter)
		if m < NO_MATCH then
			list[#list + 1] = name
			-- Ordina per match value (piu' basso = migliore) poi per nome
			order[name] = string.format("%02d", m) .. name
		end
	end
	table.sort(list, function(a, b) return order[a] < order[b] end)

	local inv = minetest.get_inventory({
		type = "detached",
		name = "inventory_" .. player_name,
	})
	if inv then
		inv:set_size("main", #list)
		inv:set_list("main", list)
	end
	st.size = #list
end

-- ============================================================
-- Costruzione del formspec per le pagine creative
-- ============================================================
-- Restituisce la stringa formspec per la pagina "inventory:<tab>".
-- Layout: griglia 8x4 di item, in basso filtro + bottoni prev/next/clear
-- + cestino + indicatore di pagina.
local function build_creative_formspec(player_name, tab_content)
	local st = player_state[player_name]
	local esc = minetest.formspec_escape

	local start = st.start_i or 0
	local pagemax = math.max(math.ceil(st.size / (4 * 8)), 1)
	local pagenum = math.floor(start / (4 * 8) + 1)

	-- Sfondo: usa una texture personalizzata "inventory_background.png"
	-- se presente in mods/inventory/textures/. Senza, Minetest mostrera'
	-- la texture mancante (un checker grigio/rosa): e' solo un placeholder.
	-- Il parametro 8 e' lo "stretch" (true=adatta alla size, false=ripeti).
	local bg = "background_img[0,0;10,7;inventory_background.png;true;8]"

	-- Icone e bottoni. Texture personalizzate: se non esistono, Minetest
	-- mostrera' la texture mancante. Servono solo i file PNG per
	-- attivare l'aspetto definitivo.
	local icons = ([[
		listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]
		image[4.08,4.2;0.8,0.8;inventory_trash_icon.png]
		list[detached:trash_%s;main;4.02,4.1;1,1;]
		listring[]
		image_button[5.00,4.05;0.8,0.8;inventory_prev_icon.png;inv_prev;]
		image_button[7.25,4.05;0.8,0.8;inventory_next_icon.png;inv_next;]
		image_button[2.63,4.05;0.8,0.8;inventory_search_icon.png;inv_search;]
		image_button[3.25,4.05;0.8,0.8;inventory_clear_icon.png;inv_clear;]
	]]):format(player_name)

	-- Campi UI: campo di filtro, tooltip, indicatore di pagina
	local ui_extra =
		"field[0.3,4.2;2.8,1.2;inv_filter;;" .. esc(st.filter) .. "]" ..
		"field_enter_after_edit[inv_filter;true]" ..
		"field_close_on_enter[inv_filter;false]" ..
		"tooltip[inv_search;"   .. esc(S("Search"))        .. "]" ..
		"tooltip[inv_clear;"    .. esc(S("Reset"))         .. "]" ..
		"tooltip[inv_prev;"     .. esc(S("Previous page")) .. "]" ..
		"tooltip[inv_next;"     .. esc(S("Next page"))     .. "]" ..
		"label[5.8,4.15;" .. minetest.colorize("#FFFF00",
			tostring(pagenum) .. " / " .. tostring(pagemax)) .. "]"

	-- La griglia 8x4 con la lista filtrata
	local lists = ([[
		list[detached:inventory_%s;main;0,0;8,4;%d]
		listring[current_player;main]
	]]):format(player_name, start)

	-- Messaggio "no items" se la tab e' vuota
	local empty = st.size == 0
		and ("label[3,2;" .. esc(S("No items to show.")) .. "]") or ""

	return bg .. empty .. icons .. ui_extra .. lists
end

-- ============================================================
-- Pagina survival: solo l'inventario del player + craft 2x2
-- ============================================================
-- Mostra l'HUD inventario (mostrata anche da moninv.make_formspec con
-- show_inv=true) piu' il crafting 2x2 in alto a sinistra + output.
local function build_survival_formspec()
	-- 2x2 craft a sinistra, freccia + output a destra.
	-- Posizionamento alto per non sovrapporsi con la hotbar in basso.
	return ([[
		list[current_player;craft;0.3,0.5;2,2;]
		image[2.4,1.05;1,0.5;moninv_crafting_arrow.png]
		list[current_player;craftpreview;3.5,0.85;1,1;]
		listring[current_player;main]
		listring[current_player;craft]
	]])
end

-- ============================================================
-- Helper: registra una pagina "tab creativa"
-- ============================================================
-- Crea la pagina, la callback on_player_receive_fields per gestire i
-- bottoni (filtro, paginazione, cestino) e il rendering.
local function register_creative_tab(tab_id, title)
	moninv.register_page("inventory:" .. tab_id, {
		title = title,
		-- La pagina compare nelle tab solo se il giocatore e' "creative"
		is_in_nav = function(_self, player, _context)
			return is_player_creative(player:get_player_name())
		end,
		-- Costruisce il formspec
		get = function(_self, player, _context)
			local pn = player:get_player_name()
			ensure_player_inventory(pn)
			update_list(pn, tab_id)
			return moninv.make_formspec(player, _context,
				build_creative_formspec(pn, tab_id), true)
		end,
		-- Quando si entra, resetta la paginazione
		on_enter = function(_self, player, _context)
			local st = player_state[player:get_player_name()]
			if st then
				st.start_i = 0
			end
		end,
		-- Gestione dei bottoni (filtro, prev/next, clear)
		on_player_receive_fields = function(_self, player, context, fields)
			local st = player_state[player:get_player_name()]
			if not st then
				return false
			end

			if fields.inv_clear then
				st.start_i, st.filter = 0, ""
				moninv.set_player_inventory_formspec(player, context)
				return true
			elseif (fields.inv_search
					or fields.key_enter_field == "inv_filter")
					and fields.inv_filter ~= nil then
				st.start_i = 0
				st.filter = fields.inv_filter
					:sub(1, 128)
					:gsub("[%z\1-\8\11-\31\127]", "")
					:lower()
				moninv.set_player_inventory_formspec(player, context)
				return true
			elseif not fields.quit then
				if fields.inv_prev then
					st.start_i = st.start_i - 32
					if st.start_i < 0 then
						st.start_i = st.size - (st.size % 32)
						if st.size == st.start_i then
							st.start_i = math.max(0, st.size - 32)
						end
					end
				elseif fields.inv_next then
					st.start_i = st.start_i + 32
					if st.start_i >= st.size then
						st.start_i = 0
					end
				end
				moninv.set_player_inventory_formspec(player, context)
				return true
			end
			return false
		end,
	})
end

-- ============================================================
-- Registrazione delle pagine
-- ============================================================
-- Sopravvivenza: sempre visibile
moninv.register_page("inventory:survival", {
	title = S("Survival"),
	is_in_nav = function() return true end,
	get = function(_self, player, context)
		return moninv.make_formspec(player, context,
			build_survival_formspec(), true)
	end,
})

-- Tab creative: visibili solo se il player e' "creative"
register_creative_tab("all",        S("All"))
register_creative_tab("nodes",      S("Nodes"))
register_creative_tab("tools",      S("Tools"))
register_creative_tab("craftitems", S("Items"))

-- ============================================================
-- Homepage: dipende dal privilege del giocatore
-- ============================================================
-- Override di moninv.get_homepage_name: la prima volta che il giocatore
-- apre l'inventario, la pagina iniziale dipende dai suoi privilegi.
local old_home = moninv.get_homepage_name
function moninv.get_homepage_name(player)
	-- Se il player e' "creative" (privilege o motore), apri sulla tab 'all';
	-- altrimenti apri sulla pagina di sopravvivenza.
	if is_player_creative(player:get_player_name()) then
		return "inventory:all"
	end
	return "inventory:survival"
end
-- (old_home non serve per niente, ma lo conservo come promemoria che
-- la funzione era gia' definita dal framework moninv.)

-- ============================================================
-- Privilege 'creative'
-- ============================================================
-- Chi possiede questo privilege accede all'inventario creative-like.
-- Non viene dato di default al singleplayer perche' in singleplayer la
-- decisione dipende dalla spunta "Creative Mode" del mondo (vedi
-- is_player_creative). L'admin del server lo ottiene invece per default.
-- Un giocatore in singleplayer survival puo' concederselo con
--   /grantme creative
-- Un admin puo' concederlo ad altri player con
--   /grant creative NomePlayer
minetest.register_privilege("creative", {
	description = S("Allow player to use the item inventory"),
	give_to_singleplayer = false,
	give_to_admin = true,
})

-- ============================================================
-- Hook di gioco
-- ============================================================
-- Quando il giocatore esce, pulisce lo stato.
minetest.register_on_leaveplayer(function(player)
	player_state[player:get_player_name()] = nil
end)

-- Dopo che tutte le mod hanno registrato i loro item, costruisci la cache.
minetest.register_on_mods_loaded(rebuild_group_cache)
