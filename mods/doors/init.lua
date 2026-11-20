-- Registrazione della porta CHIUSA (Hitbox alta 2 blocchi: da -0.5 a 1.5 in Y)
minetest.register_node("doors:door_closed", {
    description = "Wooden Door",
    drawtype = "mesh",
    mesh = "door.obj",
    tiles = {"door.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,

    node_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.35},
    },
    selection_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.35},
    },
    collision_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.35},
    },

    groups = {choppy = 2, oddly_breakable_by_hand = 2},

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
    local fdir = node.param2
    node.name = "doors:door_open"
    node.param2 = (fdir + 1) % 4
    minetest.swap_node(pos, node)
    end,
})

-- Registrazione della porta APERTA (Hitbox alta 2 blocchi: da -0.5 a 1.5 in Y)
minetest.register_node("doors:door_open", {
    description = "Wooden Door (Open)",
                       drawtype = "mesh",
                       mesh = "door.obj",
                       tiles = {"door.png"},
                       paramtype = "light",
                       paramtype2 = "facedir",
                       sunlight_propagates = true,

                       node_box = {
                           type = "fixed",
                           fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.35},
                       },
                       selection_box = {
                           type = "fixed",
                           fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.35},
                       },
                       collision_box = {
                           type = "fixed",
                           fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, -0.35},
                       },

                       groups = {choppy = 2, oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},

                       on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
                       local fdir = node.param2
                       node.name = "doors:door_closed"
                       node.param2 = (fdir - 1) % 4
                       minetest.swap_node(pos, node)
                       end,
})
