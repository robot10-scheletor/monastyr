print("This file will be run at load time!")

minetest.register_node("nodes:burned_stone", {
    description = "Burned Stone",
    tiles = {"burned_stone.png"},
    groups = {cracky=1, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:cobblestone", {
    description = "Cobblestone",
    tiles = {"cobblestone.png"},
    groups = {cracky=1, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:dirt", {
    description = "Dirt",
    tiles = {"dirt.png"},
    groups = {crumbly=3, soil=1},
    is_ground_content = true,
})

minetest.register_node("nodes:magnetite", {
    description = "Magnetite",
    tiles = {"magnetite.png"},
    groups = {cracky=1, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:palm_leaves", {
    description = "Palm Leaves",
    tiles = {"palm_leaves.png"},
    groups = {snappy=3, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:palm_log", {
    description = "Palm Log",
    tiles = {"palm_log.png"},
    groups = {choppy=2, tree=1},
    is_ground_content = false,
})

minetest.register_node("nodes:saltwater_flowing", {
    description = "Flowing Saltwater",
    drawtype = "flowingliquid",
    tiles = {"saltwater_flowing.png"},
    special_tiles = {
        {
            name = "saltwater_flowing.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 32,
                aspect_h = 32,
                length = 2.0,
            },
        },
        {
            name = "saltwater_flowing.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 32,
                aspect_h = 32,
                length = 2.0,
            },
        },
    },
    use_texture_alpha = "blend",
    paramtype = "light",
    paramtype2 = "flowingliquid",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "flowing",
    liquid_alternative_source = "nodes:saltwater_source",
    liquid_alternative_flowing = "nodes:saltwater_flowing",
    liquid_viscosity = 1,
post_effect_color = {a = 150, r = 10, g = 60, b = 140},
groups = {liquid = 3, water = 1, not_in_creative_inventory = 1},
})


minetest.register_node("nodes:saltwater_source", {
    description = "Saltwater Source",
    drawtype = "liquid",
    tiles = {
        {
            name = "saltwater.png",
            animation = {
                type = "vertical_frames",
                aspect_w = 32,
                aspect_h = 32,
                length = 2.0,
            },
        },
    },
    use_texture_alpha = "blend",
    paramtype = "light",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "source",
    liquid_alternative_source = "nodes:saltwater_source",
    liquid_alternative_flowing = "nodes:saltwater_flowing",
    liquid_viscosity = 1,
    post_effect_color = {a = 150, r = 10, g = 60, b = 140},
    groups = {liquid = 3, water = 1},
})

minetest.register_alias("mapgen_water_source", "nodes:saltwater_source")

minetest.register_node("nodes:stone", {
    description = "Stone",
    tiles = {"stone.png"},
    groups = {cracky=1, stone=1},
    is_ground_content = true,
    drop = "nodes:cobblestone 1"
})

minetest.register_alias("mapgen_stone", "nodes:stone")

minetest.register_node("nodes:water_source", {
    description = "Water Source",
    tiles = {"water.png"},
    drawtype = "liquid",
    paramtype = "light",
    is_ground_content = false,
    groups = {liquid = 1, water = 1},
})
