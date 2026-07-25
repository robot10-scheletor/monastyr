-- moninv: un mini-framework per inventari a pagine (ispirato concettualmente
-- a sfinv di minetest_game, ma scritto da zero per il game monastyr).
--
-- Cosa fornisce:
--   * moninv.register_page(name, def)         -- registra una pagina
--   * moninv.override_page(name, def)         -- sovrascrive campi di una pagina
--   * moninv.make_formspec(p, ctx, content, show_inv)
--   * moninv.get_formspec(p, ctx)
--   * moninv.set_page(p, name)
--   * moninv.get_page(p)
--   * moninv.set_player_inventory_formspec(p, ctx)
--   * moninv.get_or_create_context(p)
--   * moninv.set_context(p, ctx)
--   * moninv.get_homepage_name(p)             -- le altre mod la sovrascrivono
--   * moninv.enabled                          -- flag globale
--
-- Effetto collaterale principale:
--   Su register_on_joinplayer, moninv chiama player:set_inventory_formspec(fs)
--   per cui il formspec inventario (costruito dalla pagina home) compare
--   automaticamente quando il giocatore preme il tasto "i".

moninv = {
	pages = {},            -- pagine indicizzate per nome
	pages_unordered = {},  -- pagine in ordine di registrazione
	contexts = {},         -- contesto per-giocatore (pagina corrente, nav, ecc.)
	enabled = true,
}

-- ------------------------------------------------------------
-- Registrazione di una pagina
-- ------------------------------------------------------------
-- Una pagina e' una tabella con questi campi (tutti opzionali tranne `get`):
--   title                  stringa usata nella tabheader
--   get(self, p, ctx)      funzione che ritorna il contenuto del formspec
--   is_in_nav(self, p, ctx)  se ritorna false, la pagina non compare nelle tab
--   on_enter / on_leave    callback di transizione
--   on_player_receive_fields(self, p, ctx, fields)
--                          callback per i campi del formspec
function moninv.register_page(name, def)
	assert(name, "[moninv] register_page: nome mancante")
	assert(def, "[moninv] register_page: def mancante")
	assert(def.get, "[moninv] register_page: serve il campo 'get'")
	assert(not moninv.pages[name],
		"[moninv] register_page: pagina " .. tostring(name) .. " gia' registrata")

	moninv.pages[name] = def
	def.name = name
	table.insert(moninv.pages_unordered, def)
end

-- Sovrascrive campi di una pagina gia' registrata (utile per le sotto-mod
-- che vogliono modificare il comportamento di una pagina di sistema).
function moninv.override_page(name, def)
	assert(name, "[moninv] override_page: nome mancante")
	local page = moninv.pages[name]
	assert(page, "[moninv] override_page: pagina " .. tostring(name) .. " inesistente")
	for k, v in pairs(def) do
		page[k] = v
	end
end

-- ------------------------------------------------------------
-- Costruzione delle tab di navigazione
-- ------------------------------------------------------------
-- Restituisce la stringa formspec `tabheader[...]` con i titoli delle pagine
-- visibili, oppure "" se ce n'e' una sola (nessuna tab utile).
function moninv.get_nav_fs(_player, _context, nav, current_idx)
	if not nav or #nav <= 1 then
		return ""
	end
	return "tabheader[0,0;moninv_nav_tabs;"
		.. table.concat(nav, ",") .. ";"
		.. tostring(current_idx) .. ";true;false]"
end

-- ------------------------------------------------------------
-- HUD inventario standard
-- ------------------------------------------------------------
-- Sono le 8 slot in basso (la "hotbar") + 3 file di 8 sotto, identiche a
-- quelle che disegnava sfinv. Disegnate qui a mano per non dipendere da
-- nessuna texture esterna. Le texture `gui_hb_bg.png` sono fornite dal
-- motore di gioco (vedi engine textures).
local theme_inv = [[
	image[0,5.2;1,1;gui_hb_bg.png]
	image[1,5.2;1,1;gui_hb_bg.png]
	image[2,5.2;1,1;gui_hb_bg.png]
	image[3,5.2;1,1;gui_hb_bg.png]
	image[4,5.2;1,1;gui_hb_bg.png]
	image[5,5.2;1,1;gui_hb_bg.png]
	image[6,5.2;1,1;gui_hb_bg.png]
	image[7,5.2;1,1;gui_hb_bg.png]
	list[current_player;main;0,5.2;8,1;]
	list[current_player;main;0,6.35;8,3;8]
]]

-- ------------------------------------------------------------
-- Helper: costruisce il formspec finale di una pagina
-- ------------------------------------------------------------
-- Aggiunge: size, tabheader, eventuale HUD inventario, contenuto della pagina.
function moninv.make_formspec(_player, context, content, show_inv, size)
	local tmp = {
		size or "size[8,9.1]",
		moninv.get_nav_fs(_player, context, context.nav_titles, context.nav_idx),
		show_inv and theme_inv or "",
		content,
	}
	return table.concat(tmp, "")
end

-- ------------------------------------------------------------
-- Costruzione del formspec dato un context
-- ------------------------------------------------------------
-- Calcola la lista di pagine visibili (quelle per cui is_in_nav ritorna vero)
-- e costruisce l'output finale. Se la pagina corrente non esiste, fallback
-- sulla homepage.
function moninv.get_formspec(player, context)
	-- Calcolo della navigazione: titoli e id delle pagine visibili, e
	-- l'indice della pagina corrente all'interno di questa lista.
	local nav, nav_ids, current_idx = {}, {}, 1
	for _, pdef in ipairs(moninv.pages_unordered) do
		if not pdef.is_in_nav or pdef:is_in_nav(player, context) then
			nav[#nav + 1] = pdef.title or pdef.name
			nav_ids[#nav_ids + 1] = pdef.name
			if pdef.name == context.page then
				current_idx = #nav_ids
			end
		end
	end
	context.nav = nav_ids
	context.nav_titles = nav
	context.nav_idx = current_idx

	local page = moninv.pages[context.page]
	if page then
		return page:get(player, context)
	end

	-- Pagina corrente non trovata: fallback sulla homepage.
	local old_page = context.page
	local home = moninv.get_homepage_name(player)
	if old_page == home then
		minetest.log("error", "[moninv] pagina " .. tostring(old_page) ..
			" non trovata ed e' anche la homepage; formspec vuoto")
		return ""
	end
	context.page = home
	assert(moninv.pages[context.page],
		"[moninv] homepage non valida: " .. tostring(home))
	minetest.log("warning", "[moninv] pagina " .. tostring(old_page) ..
		" non trovata, passo alla homepage")
	return moninv.get_formspec(player, context)
end

-- ------------------------------------------------------------
-- Gestione del contesto per-giocatore
-- ------------------------------------------------------------
-- Il contesto contiene la pagina corrente e i dati di navigazione.
function moninv.get_or_create_context(player)
	local name = player:get_player_name()
	local ctx = moninv.contexts[name]
	if not ctx then
		ctx = {
			page = moninv.get_homepage_name(player),
		}
		moninv.contexts[name] = ctx
	end
	return ctx
end

function moninv.set_context(player, context)
	moninv.contexts[player:get_player_name()] = context
end

-- ------------------------------------------------------------
-- Aggiornamento del formspec del giocatore
-- ------------------------------------------------------------
-- Questa funzione e' IL meccanismo del tasto "i": chiama
-- player:set_inventory_formspec(fs), che dice al client quale formspec
-- mostrare quando il giocatore preme il tasto inventario.
function moninv.set_player_inventory_formspec(player, context)
	local fs = moninv.get_formspec(player,
		context or moninv.get_or_create_context(player))
	player:set_inventory_formspec(fs)
end

-- ------------------------------------------------------------
-- Cambio pagina
-- ------------------------------------------------------------
-- Chiama on_leave della pagina vecchia e on_enter della nuova, poi aggiorna
-- il formspec del giocatore.
function moninv.set_page(player, pagename)
	local context = moninv.get_or_create_context(player)
	local old = moninv.pages[context.page]
	if old and old.on_leave then
		old:on_leave(player, context)
	end
	context.page = pagename
	local new = moninv.pages[pagename]
	if new and new.on_enter then
		new:on_enter(player, context)
	end
	moninv.set_player_inventory_formspec(player, context)
end

function moninv.get_page(player)
	local ctx = moninv.contexts[player:get_player_name()]
	return ctx and ctx.page or ""
end

-- ------------------------------------------------------------
-- Homepage (default: vuota, le sotto-mod la sovrascrivono)
-- ------------------------------------------------------------
-- Le sotto-mod possono ridefinire questa funzione per stabilire la pagina
-- iniziale dell'inventario (ad es. in base al privilege del giocatore).
function moninv.get_homepage_name(_player)
	return ""
end

-- ------------------------------------------------------------
-- Hook di gioco
-- ------------------------------------------------------------
-- Quando un giocatore entra, mostra l'inventario. Quando esce, pulisce.
minetest.register_on_joinplayer(function(player)
	if moninv.enabled then
		moninv.set_player_inventory_formspec(player)
	end
end)

minetest.register_on_leaveplayer(function(player)
	moninv.contexts[player:get_player_name()] = nil
end)

-- Quando il formspec dell'inventario (formname = "") riceve dei campi:
--   * se il campo e' la tabheader (moninv_nav_tabs), cambia pagina;
--   * altrimenti, delega alla callback on_player_receive_fields della pagina.
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "" or not moninv.enabled then
		return false
	end

	local name = player:get_player_name()
	local context = moninv.contexts[name]
	if not context then
		moninv.set_player_inventory_formspec(player)
		return false
	end

	-- Cambio di tab tramite tabheader
	if fields.moninv_nav_tabs and context.nav then
		local tid = tonumber(fields.moninv_nav_tabs)
		if tid and tid > 0 then
			local id = context.nav[tid]
			local page = id and moninv.pages[id]
			if page then
				moninv.set_page(player, id)
				return true
			end
		end
		return false
	end

	-- Altrimenti delega alla pagina
	local page = moninv.pages[context.page]
	if page and page.on_player_receive_fields then
		return page:on_player_receive_fields(player, context, fields)
	end
	return false
end)
