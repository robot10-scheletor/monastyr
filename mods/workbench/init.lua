
local S = minetest.get_translator and minetest.get_translator("workbench") or function(s) return s end

local workbench_formspec =
"formspec_version[3]" ..
"size[10.5,10.5]" ..
"label[0.4,0.4;" .. minetest.formspec_escape(S("Workbench")) .. "]" ..
"list[context;craft;1.4,0.9;3,3;]" ..
"label[5.75,2.35;=>]" ..
"list[context;output;6.5,1.9;1,1;]" ..
"label[0.4,5.15;" .. minetest.formspec_escape(S("Inventory")) .. "]" ..
"list[current_player;main;0.4,5.5;8,4;]"

local function get_craft_items(inv)
local items = {}
for i = 1, 9 do
    items[i] = inv:get_stack("craft", i)
    end
    return items
    end

    local function update_craft_output(pos)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    if not inv then
        return
        end

        local result = minetest.get_craft_result({
            method = "normal",
            width = 3,
            items = get_craft_items(inv),
        })
        inv:set_stack("output", 1, result.item)
        end

        minetest.register_node("workbench:workbench", {
            description = S("Workbench"),

                               -- Uso della mesh personalizzata
                               drawtype = "mesh",
                               mesh = "workbench.obj",

                               -- Texture applicata alla mesh
                               tiles = {"workbench.png"},

                               -- Gestione luce e rotazione automatica in base al giocatore
                               paramtype = "light",
                               paramtype2 = "facedir",

                               -- Selezione e collisione
                               selection_box = {
                                   type = "regular"
                               },
                               collision_box = {
                                   type = "regular"
                               },

                               groups = {cracky = 3, oddly_breakable_by_hand = 2},
                               drop = "workbench:workbench",

                               on_construct = function(pos)
                               local meta = minetest.get_meta(pos)
                               meta:set_string("infotext", S("Workbench"))
                               meta:set_string("formspec", workbench_formspec)

                               local inv = meta:get_inventory()
                               inv:set_size("craft", 9)
                               inv:set_size("output", 1)
                               end,

                               allow_metadata_inventory_put = function(pos, listname, index, stack, player)
                               if listname == "output" then
                                   return 0
                                   end
                                   return stack:get_count()
                                   end,

                                   allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
                                   if to_list == "output" then
                                       return 0
                                       end
                                       return count
                                       end,

                                       allow_metadata_inventory_take = function(pos, listname, index, stack, player)
                                       return stack:get_count()
                                       end,

                                       on_metadata_inventory_put = function(pos, listname, index, stack, player)
                                       if listname == "craft" then
                                           update_craft_output(pos)
                                           end
                                           end,

                                           on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
                                           if from_list == "craft" or to_list == "craft" or from_list == "output" then
                                               update_craft_output(pos)
                                               end
                                               end,

                                               on_metadata_inventory_take = function(pos, listname, index, stack, player)
                                               if listname == "output" then
                                                   local meta = minetest.get_meta(pos)
                                                   local inv = meta:get_inventory()
                                                   local result = minetest.get_craft_result({
                                                       method = "normal",
                                                       width = 3,
                                                       items = get_craft_items(inv),
                                                   })
                                                   if result and result.decremented_input and result.decremented_input.items then
                                                       for i, dec_stack in ipairs(result.decremented_input.items) do
                                                           inv:set_stack("craft", i, dec_stack)
                                                           end
                                                           end
                                                           update_craft_output(pos)
                                                           elseif listname == "craft" then
                                                               update_craft_output(pos)
                                                               end
                                                               end,

                                                               on_destruct = function(pos)
                                                               local meta = minetest.get_meta(pos)
                                                               local inv = meta:get_inventory()
                                                               if not inv then
                                                                   return
                                                                   end

                                                                   for i = 1, inv:get_size("craft") do
                                                                       local stack = inv:get_stack("craft", i)
                                                                       if not stack:is_empty() then
                                                                           minetest.add_item(pos, stack)
                                                                           end
                                                                           end
                                                                           end,
        })
