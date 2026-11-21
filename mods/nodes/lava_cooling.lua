-- Raffreddamento fonte di lava -> ossidiana
minetest.register_abm({
    label = "Monastyr lava source cooling",
    nodenames = {"nodes:lava_source"},
    neighbors = {"group:cools_lava"},
    interval = 1,
    chance = 1,
    catch_up = false,
    action = function(pos)
    if minetest.find_node_near(pos, 1, {"group:cools_lava"}) then
        minetest.set_node(pos, {name = "nodes:obsidian"})
        end
        end,
})

-- Raffreddamento lava che scorre -> pietra
minetest.register_abm({
    label = "Monastyr flowing lava cooling",
    nodenames = {"nodes:lava_flowing"},
    neighbors = {"group:cools_lava"},
    interval = 1,
    chance = 1,
    catch_up = false,
    action = function(pos)
    if minetest.find_node_near(pos, 1, {"group:cools_lava"}) then
        minetest.set_node(pos, {name = "nodes:stone"})
        end
        end,
})
