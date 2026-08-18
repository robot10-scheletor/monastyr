print("This file will be run at load time!")

minetest.register_node("nodes:acacia_leaves", {
    description = "Acacia Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"acacia_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:acacia_log", {
    description = "Acacia Log",
    tiles = {"acacia_log_top.png", "acacia_log_top.png", "acacia_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:acacia_planks", {
    description = "Acacia Planks",
    tiles = {"acacia_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:apple_tree_leaves", {
    description = "Apple Tree Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"apple_tree_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:apple_tree_log", {
    description = "Apple Tree Log",
    tiles = {"apple_tree_log_top.png", "apple_tree_log_top.png", "apple_tree_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:apple_tree_planks", {
    description = "Apple Tree Planks",
    tiles = {"apple_tree_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:ash", {
    description = "Ash",
    tiles = {"ash.png"},
    paramtype = "light",
    buildable_to = true,
    floodable = true,
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -6 / 16, 0.5},
        },
    },
    groups = {crumbly = 10, falling_node = 1, snowy = 1},

    on_construct = function(pos)
    pos.y = pos.y - 1
    if minetest.get_node(pos).name == "nodes:dirt_with_grass" then
        minetest.set_node(pos, {name = "nodes:dirt_with_snow"})
        end
        end,
})

minetest.register_node("nodes:birch_leaves", {
    description = "Birch Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"birch_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:birch_log", {
    description = "Birch Log",
    tiles = {"birch_log_top.png", "birch_log_top.png", "birch_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:birch_planks", {
    description = "Birch Planks",
    tiles = {"birch_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:black_diamond_ore", {
    description = "Black Diamond Ore",
    tiles = {
        "stone.png^black_diamond_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})


minetest.register_node("nodes:blusk_leaves", {
    description = "Blusk Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"blusk_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:blusk_log", {
    description = "Blusk Log",
    tiles = {"blusk_log_top.png", "blusk_log_top.png", "blusk_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:blusk_planks", {
    description = "Blusk Planks",
    tiles = {"blusk_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:bricks", {
    description = "Bricks",
    tiles = {"bricks.png"},
    groups = {cracky=1},
    is_ground_content = false,
})

minetest.register_node("nodes:burned_log", {
    description = "Burned Log",
    tiles = {"burned_log_top.png", "burned_log_top.png", "burned_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:burned_planks", {
    description = "Burned Planks",
    tiles = {"burned_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:burned_stone", {
    description = "Burned Stone",
    tiles = {"burned_stone.png"},
    groups = {cracky=2, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:cement", {
    description = "Cement",
    tiles = {"cement.png"},
    groups = {cracky=6, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:coal_ore", {
    description = "Coal Ore",
    tiles = {
        "stone.png^coal_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:cobblestone", {
    description = "Cobblestone",
    tiles = {"cobblestone.png"},
    groups = {cracky=2, stone=1},
    is_ground_content = false,
})

minetest.register_node("nodes:copper_ore", {
    description = "Copper Ore",
    tiles = {
        "stone.png^copper_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:diamond_ore", {
    description = "Diamond Ore",
    tiles = {
        "stone.png^diamond_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:dirt", {
    description = "Dirt",
    tiles = {"dirt.png"},
    groups = {crumbly=7, soil=1},
    is_ground_content = true,
})

minetest.register_node("nodes:dirt_with_dry_grass", {
    description = "Dirt With Dry Grass",

    -- Gestione delle texture con overlay (utilizzando l'operatore ^)
tiles = {
    -- 1. Faccia SUPERIORE: Terra + Overlay Erba dall'alto
    "dirt.png^dry_grass_top.png",

    -- 2. Faccia INFERIORE: Solo Terra
    "dirt.png",

    -- 3. FACCE LATERALI (tutti e 4 i lati): Terra + Overlay Erba sul bordo superiore
    "dirt.png^dry_grass_side.png"
},

groups = {crumbly = 7, soil = 1},
drop = "nodes:dirt 1"
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

minetest.register_node("nodes:dirt_with_magic_grass", {
    description = "Dirt With Magic Grass",

    -- Gestione delle texture con overlay (utilizzando l'operatore ^)
tiles = {
    -- 1. Faccia SUPERIORE: Terra + Overlay Erba dall'alto
    "dirt.png^magic_grass_top.png",

    -- 2. Faccia INFERIORE: Solo Terra
    "dirt.png",

    -- 3. FACCE LATERALI (tutti e 4 i lati): Terra + Overlay Erba sul bordo superiore
    "dirt.png^magic_grass_side.png"
},

groups = {crumbly = 7, soil = 1},
drop = "nodes:dirt 1"
})

minetest.register_node("nodes:dirt_with_obscure_grass", {
    description = "Dirt With Obscure Grass",

    -- Gestione delle texture con overlay (utilizzando l'operatore ^)
tiles = {
    -- 1. Faccia SUPERIORE: Terra + Overlay Erba dall'alto
    "dirt.png^obscure_grass_top.png",

    -- 2. Faccia INFERIORE: Solo Terra
    "dirt.png",

    -- 3. FACCE LATERALI (tutti e 4 i lati): Terra + Overlay Erba sul bordo superiore
    "dirt.png^obscure_grass_side.png"
},

groups = {crumbly = 7, soil = 1},
drop = "nodes:dirt 1"
})

minetest.register_node("nodes:dirt_with_red_grass", {
    description = "Tundra's Dirt",

    -- Gestione delle texture con overlay (utilizzando l'operatore ^)
tiles = {
    -- 1. Faccia SUPERIORE: Terra + Overlay Erba dall'alto
    "dirt.png^tundra_grass_top.png",

    -- 2. Faccia INFERIORE: Solo Terra
    "dirt.png",

    -- 3. FACCE LATERALI (tutti e 4 i lati): Terra + Overlay Erba sul bordo superiore
    "dirt.png^tundra_grass_side.png"
},

groups = {crumbly = 7, soil = 1},
drop = "nodes:dirt 1"
})

minetest.register_node("nodes:dirt_with_snow", {
    description = "Dirt With Snow",
    tiles = {
        "dirt.png^snowy_grass_top.png",
        "dirt.png",
        "dirt.png^snowy_grass_side.png"
    },
    groups = {crumbly = 7, soil = 1},
    drop = "nodes:dirt 1"
})

minetest.register_node("nodes:ebony_leaves", {
    description = "Ebony Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"ebony_leaves.png"},
    groups = {snappy=7, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:ebony_log", {
    description = "Ebony Log",
    tiles = {"ebony_log_top.png", "ebony_log_top.png", "ebony_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:ebony_planks", {
    description = "Ebony Planks",
    tiles = {"ebony_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:frostwood_leaves", {
    description = "Frostwood Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"frostwood_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:frostwood_log", {
    description = "Frostwood Log",
    tiles = {"frostwood_log_top.png", "frostwood_log_top.png", "frostwood_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:frostwood_planks", {
    description = "Frostwood Planks",
    tiles = {"frostwood_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:glassified_sand", {
    description = "Glassified Sand",
    drawtype = "glasslike",
    tiles = {"glassified_sand.png"},
    groups = {cracky=5},
    is_ground_content = true,
    use_texture_alpha = "blend",
    paramtype = "light",
    sunlight_propagates = true
})

minetest.register_node("nodes:glassy_sand", {
    description = "Glassy Sand",
    tiles = {"glassy_sand.png"},
    groups = {crumbly = 8, soil = 1, falling_node = 1},
    is_ground_content = true,
})

minetest.register_node("nodes:gold_ore", {
    description = "Gold Ore",
    tiles = {
        "stone.png^gold_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:ice", {
    description = "Ice",
    drawtype = "glasslike",
    tiles = {"ice.png"},
    is_ground_content = false,
    paramtype = "light",
    use_texture_alpha = "blend",
    sunlight_propagates = true,
    groups = {cracky = 9, cools_lava = 1, slippery = 10},
})

minetest.register_node("nodes:iron_ore", {
    description = "Iron Ore",
    tiles = {
        "stone.png^iron_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:lava_flowing", {
    description = "Flowing Lava",
    drawtype = "flowingliquid",
    tiles = {"lava_flowing.png"},
    special_tiles = {
        {
            name = "lava_flowing.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 32,
                aspect_h = 32,
                length = 1.0,
            },
        },
        {
            name = "lava_flowing.png",
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
    liquid_alternative_source = "nodes:lava_source",
    liquid_alternative_flowing = "nodes:lava_flowing",
    liquid_viscosity = 1,
    post_effect_color = {a = 150, r = 10, g = 60, b = 140},
    groups = {liquid = 3, water = 1, not_in_creative_inventory = 1},
})


minetest.register_node("nodes:lava_source", {
    description = "Lava Source",
    drawtype = "liquid",
    tiles = {
        {
            name = "lava.png",
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
    liquid_alternative_source = "nodes:lava_source",
    liquid_alternative_flowing = "nodes:lava_flowing",
    liquid_viscosity = 1,
    post_effect_color = {a = 150, r = 10, g = 60, b = 140},
    groups = {liquid = 3, water = 1},
})

minetest.register_alias("mapgen_lava_source", "nodes:lava_source")

minetest.register_node("nodes:lemon_tree_leaves", {
    description = "Lemon Tree Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"lemon_tree_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:lemon_tree_log", {
    description = "Lemon Tree Log",
    tiles = {"lemon_tree_log_top.png", "lemon_tree_log_top.png", "lemon_tree_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:lemon_tree_planks", {
    description = "Lemon Tree Planks",
    tiles = {"lemon_tree_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:magnetite", {
    description = "Magnetite",
    tiles = {"magnetite.png"},
    groups = {cracky=3, stone=1},
    is_ground_content = true,
})

minetest.register_node("nodes:mithril_ore", {
    description = "Mithril Ore",
    tiles = {
        "stone.png^mithril_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:oak_leaves", {
    description = "Oak Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"oak_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:oak_log", {
    description = "Oak Log",
    tiles = {"oak_log_top.png", "oak_log_top.png", "oak_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:oak_planks", {
    description = "Oak Planks",
    tiles = {"oak_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:obscure_oak_leaves", {
    description = "Obscure Oak Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"obscure_oak_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:obscure_oak_log", {
    description = "Obscure Oak Log",
    tiles = {"obscure_oak_log_top.png", "obscure_oak_log_top.png", "obscure_oak_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:obscure_oak_planks", {
    description = "Obscure Oak Planks",
    tiles = {"obscure_oak_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:obsidian", {
    description = "Obsidian",
    tiles = {"obsidian.png"},
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:orcish_ore", {
    description = "Orcish Ore",
    tiles = {
        "stone.png^orcish_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
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
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:palm_planks", {
    description = "Palm Planks",
    tiles = {"palm_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:pine_leaves", {
    description = "Pine Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"pine_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:pine_log", {
    description = "Pine Log",
    tiles = {"pine_log_top.png", "pine_log_top.png", "pine_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:pine_planks", {
    description = "Pine Planks",
    tiles = {"pine_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:poplar_leaves", {
    description = "Poplar Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"poplar_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:poplar_log", {
    description = "Poplar Log",
    tiles = {"poplar_log_top.png", "poplar_log_top.png", "poplar_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:poplar_planks", {
    description = "Poplar Planks",
    tiles = {"poplar_planks.png"},
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


minetest.register_node("nodes:silver_ore", {
    description = "Silver Ore",
    tiles = {
        "stone.png^silver_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:snow", {
    description = "Snow",
                       tiles = {"snow.png"},
                       paramtype = "light",
                       buildable_to = true,
                       floodable = true,
                       drawtype = "nodebox",
                       node_box = {
                           type = "fixed",
                           fixed = {
                               {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
                           },
                       },
                       collision_box = {
                           type = "fixed",
                           fixed = {
                               {-0.5, -0.5, -0.5, 0.5, -6 / 16, 0.5},
                           },
                       },
                       groups = {crumbly = 10, falling_node = 1, snowy = 1},

                       on_construct = function(pos)
                       pos.y = pos.y - 1
                       if minetest.get_node(pos).name == "nodes:dirt_with_grass" then
                           minetest.set_node(pos, {name = "nodes:dirt_with_snow"})
                           end
                           end,
})


minetest.register_node("nodes:shield_with_swords", {
    description = "Shield With Swords",

    -- Uso della mesh personalizzata
    drawtype = "mesh",
    mesh = "shield_with_swords.obj",

    -- Texture applicata alla mesh
    tiles = {"shield_with_swords.png"},

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
})

minetest.register_node("nodes:snow_block", {
    description = "Snow Block",
    tiles = {"snow.png"},
    paramtype = "light",
    floodable = true,
    groups = {crumbly = 10, falling_node = 1, snowy = 1},
    on_construct = function(pos)
    pos.y = pos.y - 1
    if minetest.get_node(pos).name == "nodes:dirt_with_grass" then
        minetest.set_node(pos, {name = "nodes:dirt_with_snow"})
        end
        end,
})

minetest.register_node("nodes:spruce_leaves", {
    description = "Spruce Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"spruce_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:spruce_log", {
    description = "Spruce Log",
    tiles = {"spruce_log_top.png", "spruce_log_top.png", "spruce_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:spruce_planks", {
    description = "Spruce Planks",
    tiles = {"spruce_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})


minetest.register_node("nodes:stone", {
    description = "Stone",
    tiles = {"stone.png"},
    groups = {cracky=1, stone=1},
    is_ground_content = true,
    drop = "nodes:cobblestone 1"
})

minetest.register_node("nodes:stone_bricks", {
    description = "Stone Bricks",
    tiles = {"stone_bricks.png"},
    groups = {cracky=1, stone=1},
    is_ground_content = false,
})

minetest.register_alias("mapgen_stone", "nodes:stone")

minetest.register_node("nodes:tin_ore", {
    description = "Tin Ore",
    tiles = {
        "stone.png^tin_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:tungsten_ore", {
    description = "Tungsten Ore",
    tiles = {
        "stone.png^tungsten_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})

minetest.register_node("nodes:turquoise_ore", {
    description = "Turquoise Ore",
    tiles = {
        "stone.png^turquoise_ore_overlay.png",
    },
    groups = {cracky = 7, stone=1},
})


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

minetest.register_node("nodes:weeping_willow_leaves", {
    description = "Weeping Willow Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"weeping_willow_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:weeping_willow_log", {
    description = "Weeping Willow Log",
    tiles = {"weeping_willow_log_top.png", "weeping_willow_log_top.png", "weeping_willow_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})
minetest.register_node("nodes:weeping_willow_planks", {
    description = "Weeping Willow Planks",
    tiles = {"weeping_willow_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:willow_leaves", {
    description = "Willow Leaves",
    drawtype = "allfaces_optional",
    paramtype = "light",
    waving = 1,
    tiles = {"willow_leaves.png"},
    groups = {snappy=9, leafdecay=3, leaves=1},
    is_ground_content = false,
})

minetest.register_node("nodes:willow_log", {
    description = "Willow Log",
    tiles = {"willow_log_top.png", "willow_log_top.png", "willow_log.png"},
    paramtype2 = "facedir",
    groups = {choppy=4, tree=1},
    is_ground_content = false,
    on_place = minetest.rotate_node
})

minetest.register_node("nodes:willow_planks", {
    description = "Willow Planks",
    tiles = {"willow_planks.png"},
    groups = {choppy=5, wood = 1},
    is_ground_content = false,
})

minetest.register_node("nodes:workbench", {
    description = "Workbench",

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
})
