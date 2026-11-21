local S = minetest.get_translator and minetest.get_translator("furnace") or function(s) return s end

-- Verifica se un ItemStack appartiene al gruppo "flammable"
local function is_flammable(stack)
if not stack or stack:is_empty() then
    return false
    end
    return minetest.get_item_group(stack:get_name(), "flammable") > 0
    end

    -- Restituisce il tempo di combustione in secondi in base al valore del gruppo flammable (minimo 10s)
    local function get_flammable_burn_time(stack)
    local group_val = minetest.get_item_group(stack:get_name(), "flammable")
    if group_val <= 0 then
        return 0
        end
        -- Es: flammable = 1 -> 10s, flammable = 2 -> 20s, flammable = 3 -> 30s
        return group_val * 10
        end

        -- Costruisce il formspec con barra di progresso di combustione e cottura
        local function get_furnace_formspec(fuel_percent, item_percent)
        fuel_percent = math.max(0, math.min(100, math.floor(fuel_percent or 0)))
        item_percent = math.max(0, math.min(100, math.floor(item_percent or 0)))

        return
        "formspec_version[3]" ..
        "size[11.2,11.2]" ..
        "label[0.4,0.4;" .. minetest.formspec_escape(S("Furnace")) .. "]" ..
        -- Griglia 2x2 per gli oggetti da cuocere (src)
        "label[1.4,0.75;" .. minetest.formspec_escape(S("Input")) .. "]" ..
        "list[context;src;1.4,1.05;2,2;]" ..
        -- Slot combustibile (fuel) sotto la griglia 2x2
        "label[1.4,3.65;" .. minetest.formspec_escape(S("Fuel")) .. "]" ..
        "list[context;fuel;1.4,3.95;1,1;]" ..
        -- Indicatori testuali stato fuoco e progresso cottura
        "label[4.3,2.05;" .. minetest.formspec_escape(S("Cooking: ") .. item_percent .. "%") .. "]" ..
        "label[4.3,2.55;" .. minetest.formspec_escape(S("Fuel: ") .. fuel_percent .. "%") .. "]" ..
        "label[6.6,2.3;" .. "=>" .. "]" ..
        -- Slot output (dst)
        "label[7.3,1.7;" .. minetest.formspec_escape(S("Output")) .. "]" ..
        "list[context;dst;7.3,2.0;1,1;]" ..
        -- Inventario giocatore (8x4)
        "label[0.4,5.35;" .. minetest.formspec_escape(S("Inventory")) .. "]" ..
        "list[current_player;main;0.4,5.7;8,4;]"
        end

        -- Trova il primo slot nella griglia 2x2 (1..4) che ha una ricetta di cottura valida e spazio nell'output
        local function find_cookable_slot(inv)
        for i = 1, 4 do
            local stack = inv:get_stack("src", i)
            if not stack:is_empty() then
                local cooked, aftercooked = minetest.get_craft_result({
                    method = "cooking",
                    width = 1,
                    items = {stack},
                })
                if cooked and not cooked.item:is_empty() and inv:room_for_item("dst", cooked.item) then
                    return i, cooked, aftercooked
                    end
                    end
                    end
                    return nil, nil, nil
                    end

                    local function furnace_node_timer(pos, elapsed)
                    local meta = minetest.get_meta(pos)
                    local inv = meta:get_inventory()

                    local fuel_time = meta:get_float("fuel_time")
                    local fuel_totaltime = meta:get_float("fuel_totaltime")
                    local src_time = meta:get_float("src_time")

                    local cookable_index, cooked, aftercooked = find_cookable_slot(inv)
                    local active = false

                    -- Se c'è combustibile attivo che sta bruciando
                    if fuel_time < fuel_totaltime then
                        fuel_time = fuel_time + elapsed
                        if cookable_index then
                            active = true
                            src_time = src_time + elapsed
                            local cook_duration = (cooked.time and cooked.time > 0) and cooked.time or 3.0

                            if src_time >= cook_duration then
                                -- Cottura completata: aggiungi output e scala 1 oggetto dallo slot src attivo
                                inv:add_item("dst", cooked.item)
                                inv:set_stack("src", cookable_index, aftercooked.items[1])
                                src_time = 0
                                end
                                else
                                    src_time = 0
                                    end
                                    else
                                        -- Combustibile esaurito: prova ad accendere un nuovo item da "fuel" se c'è qualcosa da cuocere
                                        if cookable_index then
                                            local fuel_stack = inv:get_stack("fuel", 1)
                                            local burn_time = get_flammable_burn_time(fuel_stack)
                                            if burn_time > 0 then
                                                fuel_stack:take_item(1)
                                                inv:set_stack("fuel", 1, fuel_stack)
                                                fuel_time = 0
                                                fuel_totaltime = burn_time
                                                active = true
                                                else
                                                    fuel_time = 0
                                                    fuel_totaltime = 0
                                                    src_time = 0
                                                    end
                                                    else
                                                        fuel_time = 0
                                                        fuel_totaltime = 0
                                                        src_time = 0
                                                        end
                                                        end

                                                        -- Calcola percentuali per aggiornare la UI
                                                        local fuel_percent = 0
                                                        if fuel_totaltime > 0 then
                                                            fuel_percent = math.max(0, 100 - math.floor((fuel_time / fuel_totaltime) * 100))
                                                            end

                                                            local item_percent = 0
                                                            if cookable_index and cooked then
                                                                local cook_duration = (cooked.time and cooked.time > 0) and cooked.time or 3.0
                                                                item_percent = math.floor((src_time / cook_duration) * 100)
                                                                end

                                                                meta:set_float("fuel_time", fuel_time)
                                                                meta:set_float("fuel_totaltime", fuel_totaltime)
                                                                meta:set_float("src_time", src_time)
                                                                meta:set_string("formspec", get_furnace_formspec(fuel_percent, item_percent))

                                                                if active then
                                                                    meta:set_string("infotext", S("Furnace (Active)"))
                                                                    return true
                                                                    else
                                                                        meta:set_string("infotext", S("Furnace (Inactive)"))
                                                                        return false
                                                                        end
                                                                        end

                                                                        minetest.register_node("furnace:furnace", {
                                                                            description = S("Furnace"),

                                                                                               -- Sostituisci con drawtype = "mesh" se hai un file furnace.obj come per il workbench
                                                                                               tiles = {
                                                                                                   "stone.png",
                                                                                                   "stone.png",
                                                                                                   "stone.png",
                                                                                                   "stone.png",
                                                                                                   "stone.png",
                                                                                                   "furnace_front.png",
                                                                                               },

                                                                                               paramtype2 = "facedir",
                                                                                               groups = {cracky = 2, oddly_breakable_by_hand = 2},
                                                                                               drop = "furnace:furnace",

                                                                                               on_construct = function(pos)
                                                                                               local meta = minetest.get_meta(pos)
                                                                                               meta:set_string("infotext", S("Furnace (Inactive)"))
                                                                                               meta:set_string("formspec", get_furnace_formspec(0, 0))
                                                                                               meta:set_float("fuel_time", 0)
                                                                                               meta:set_float("fuel_totaltime", 0)
                                                                                               meta:set_float("src_time", 0)

                                                                                               local inv = meta:get_inventory()
                                                                                               inv:set_size("src", 4)   -- Griglia 2x2
                                                                                               inv:set_size("fuel", 1)  -- 1 slot combustibile
                                                                                               inv:set_size("dst", 1)   -- 1 slot output
                                                                                               end,

                                                                                               on_timer = furnace_node_timer,

                                                                                               can_dig = function(pos, player)
                                                                                               local meta = minetest.get_meta(pos)
                                                                                               local inv = meta:get_inventory()
                                                                                               return inv:is_empty("src") and inv:is_empty("fuel") and inv:is_empty("dst")
                                                                                               end,

                                                                                               allow_metadata_inventory_put = function(pos, listname, index, stack, player)
                                                                                               if listname == "dst" then
                                                                                                   -- Vietato inserire oggetti manualmente nello slot di output
                                                                                                   return 0
                                                                                                   elseif listname == "fuel" then
                                                                                                       -- Accetta SOLO blocchi o item con gruppo "flammable"
                                                                                                       if not is_flammable(stack) then
                                                                                                           return 0
                                                                                                           end
                                                                                                           return stack:get_count()
                                                                                                           elseif listname == "src" then
                                                                                                               return stack:get_count()
                                                                                                               end
                                                                                                               return 0
                                                                                                               end,

                                                                                               allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
                                                                                               local meta = minetest.get_meta(pos)
                                                                                               local inv = meta:get_inventory()
                                                                                               local stack = inv:get_stack(from_list, from_index)

                                                                                               if to_list == "dst" then
                                                                                                   return 0
                                                                                                   elseif to_list == "fuel" then
                                                                                                       if not is_flammable(stack) then
                                                                                                           return 0
                                                                                                           end
                                                                                                           return count
                                                                                                           end
                                                                                                           return count
                                                                                                           end,

                                                                                               allow_metadata_inventory_take = function(pos, listname, index, stack, player)
                                                                                               return stack:get_count()
                                                                                               end,

                                                                                               on_metadata_inventory_put = function(pos)
                                                                                               minetest.get_node_timer(pos):start(0.5)
                                                                                               end,

                                                                                               on_metadata_inventory_move = function(pos)
                                                                                               minetest.get_node_timer(pos):start(0.5)
                                                                                               end,

                                                                                               on_metadata_inventory_take = function(pos)
                                                                                               minetest.get_node_timer(pos):start(0.5)
                                                                                               end,
                                                                        })
