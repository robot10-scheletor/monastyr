print("This file will be run at load time!")

minetest.register_node("nodes:burned_stone", {
    description = "Burned Stone",
    tiles = {"burned_stone.png"},
    groups = {cracky=2, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:cobblestone", {
    description = "Cobblestone",
    tiles = {"cobblestone.png"},
    groups = {cracky=2, stone=1},
    is_ground_content = false,
})

minetest.register_node("nodes:dirt", {
    description = "Dirt",
    tiles = {"dirt.png"},
    groups = {crumbly=7, soil=1},
    is_ground_content = true,
})

minetest.register_node("nodes:dirt_with_grass", {
    description = "Dirt With Grass",

    -- Gestione delle texture con overlay (utilizzando l'operatore ^)
    tiles = {
    -- 1. Faccia SUPERIORE: Terra + Overlay Erba dall'alto
        "dirt.png^grass_top.png",

    -- 2. Faccia INFERIORE: Solo Terra
        "dirt.png",

    -- 3. FACCE LATERALI (tutti e 4 i lati): Terra + Overlay Erba sul bordo superiore
        "dirt.png^grass_side.png"
    },

    groups = {crumbly = 7, soil = 1},
    drop = "nodes:dirt 1"
})

minetest.register_node("nodes:glassified_sand", {
    description = "Glassified Sand",
    drawtype = "glasslike",
    tiles = {"glassified_sand.png"},
    groups = {cracky=5},
    is_ground_content = true,
    use_texture_alpha = "blend",
    paramtype = "light",
})

minetest.register_node("nodes:glassy_sand", {
    description = "Glassy Sand",
    tiles = {"glassy_sand.png"},
    groups = {crumbly = 8, soil = 1, falling_node = 1},
    is_ground_content = true,
})

minetest.register_node("nodes:magnetite", {
    description = "Magnetite",
    tiles = {"magnetite.png"},
    groups = {cracky=3, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:palm_leaves", {
    description = "Palm Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"palm_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:palm_log", {
    description = "Palm Log",
    tiles = {"palm_log_top.png", "palm_log_top.png", "palm_log.png"},
    groups = {choppy=4, tree=1},
    is_ground_content = false,
})

minetest.register_node("nodes:palm_planks", {
    description = "Palm Planks",
    tiles = {"palm_planks.png"},
    groups = {choppy=5, wood = 1},
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
                length = 1.0,
            },
        },
        {
            name = "saltwater_flowing.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 32,
                aspect_h = 32,
                length = 1.0,
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

minetest.register_node("nodes:sand", {
    description = "Sand",
    tiles = {"sand.png"},
    groups = {crumbly=8, soil=1, falling_node = 1},
    is_ground_content = true,
})

minetest.register_node("nodes:stone", {
    description = "Stone",
    tiles = {"stone.png"},
    groups = {cracky=1, stone=1},
    is_ground_content = true,
    drop = "nodes:cobblestone 1"
})

minetest.register_alias("mapgen_stone", "nodes:stone")

minetest.register_node("nodes:water_flowing", {
    description = "Flowing Water",
    drawtype = "flowingliquid",
    tiles = {"water_flowing.png"},
    special_tiles = {
        {
            name = "water_flowing.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 32,
                aspect_h = 32,
                length = 1.0,
            },
        },
        {
            name = "water_flowing.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 32,
                aspect_h = 32,
                length = 1.0,
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
    liquid_alternative_source = "nodes:water_source",
    liquid_alternative_flowing = "nodes:water_flowing",
    liquid_viscosity = 1,
    post_effect_color = {a = 150, r = 10, g = 60, b = 140},
    groups = {liquid = 3, water = 1, not_in_creative_inventory = 1},
})


minetest.register_node("nodes:water_source", {
    description = "Water Source",
    drawtype = "liquid",
    tiles = {
        {
            name = "water.png",
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
    liquid_alternative_source = "nodes:water_source",
    liquid_alternative_flowing = "nodes:water_flowing",
    liquid_viscosity = 1,
    post_effect_color = {a = 150, r = 10, g = 60, b = 140},
    groups = {liquid = 3, water = 1},
})
