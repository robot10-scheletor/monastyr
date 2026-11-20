local S = core.get_translator and core.get_translator("chest") or function(s) return s end

-- Formspec con inventario della chest (32 slot: 8x4) e inventario del giocatore (32 slot: 8x4)
local chest_formspec =
"formspec_version[4]" ..
"size[10.5,11.3]" ..
"label[0.375,0.45;" .. core.formspec_escape(S("Chest")) .. "]" ..
"list[context;main;0.375,0.75;8,4;]" ..
"label[0.375,6.05;" .. core.formspec_escape(S("Inventory")) .. "]" ..
"list[current_player;main;0.375,6.35;8,4;]" ..
"listring[context;main]" ..
"listring[current_player;main]"

core.register_node("chest:chest_base", {
    description = S("Chest"),
                   tiles = {
                       "chest_top.png",
                       "chest_top.png",
                       "chest_side.png",
                       "chest_side.png",
                       "chest_side.png",
                       "chest_front.png",
                   },
                   paramtype2 = "facedir",
                   groups = {choppy = 2, oddly_breakable_by_hand = 2},
                   drop = "chest:chest_base",

                   on_construct = function(pos)
                   local meta = core.get_meta(pos)
                   meta:set_string("formspec", chest_formspec)
                   meta:set_string("infotext", S("Chest"))

                   local inv = meta:get_inventory()
                   inv:set_size("main", 8 * 4)
                   end,

                   -- Impedisce di scavare la chest finché contiene oggetti (evita perdite accidentali)
can_dig = function(pos, player)
local meta = core.get_meta(pos)
local inv = meta:get_inventory()
return inv:is_empty("main")
end,

-- Messaggio utile se il giocatore prova a romperla mentre è piena
on_blast = function(pos)
local drops = {}
local meta = core.get_meta(pos)
local inv = meta:get_inventory()
if not inv:is_empty("main") then
    for i = 1, inv:get_size("main") do
        local stack = inv:get_stack("main", i)
        if not stack:is_empty() then
            table.insert(drops, stack)
            end
            end
            end
            table.insert(drops, "chest:chest_base")
            core.remove_node(pos)
            return drops
            end,
})
