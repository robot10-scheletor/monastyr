
minetest.register_biome({
    name = "city_ruins",

    -- Strati del terreno emerso
    node_top = "nodes:cement",
    depth_top = 2,

    node_filler = "nodes:cement",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = -30,
    y_max = 31000,

    -- PUNTI CLIMATICI
    heat_point = 55,
    humidity_point = 45,
})

minetest.register_biome({
    name = "desert",

    -- Strati del terreno emerso
    node_top = "nodes:sand",
    depth_top = 5,

    node_filler = "nodes:desert_stone",
    depth_filler = 10,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = -31000,
    y_max = 40,

    -- PUNTI CLIMATICI
    heat_point = 90,
    humidity_point = 0,
})

minetest.register_biome({
    name = "ebony_forest",
    node_top = "nodes:dirt_with_dry_grass",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 40,
    heat_point = 60,
    humidity_point = 42,
})

minetest.register_biome({
    name = "forest",
    node_top = "nodes:dirt_with_grass",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 40,
    heat_point = 45,
    humidity_point = 65,
})

minetest.register_biome({
    name = "frost_lands",
    node_dust = "nodes:snow",
    node_top = "nodes:snow_block",
    depth_top = 1,
    node_filler = "nodes:snow_block",
    depth_filler = 3,
    node_stone = "nodes:stone",
    node_water_top = "nodes:ice",
    depth_water_top = 20,
    node_river_water = "nodes:ice",
    node_riverbed = "nodes:sande",
    depth_riverbed = 2,
    node_dungeon = "nodes:ice",
    y_max = 31000,
    y_min = 1,
    heat_point = 0,
    humidity_point = 73,
})

minetest.register_biome({
    name = "frost_ocean",
    node_top = "nodes:sand",
    depth_top = 1,
    node_filler = "nodes:sand",
    depth_filler = 3,
    node_stone = "nodes:stone",
    node_water_top = "nodes:ice",
    depth_water_top = 20,
    y_max = 1,
    y_min = -31000,
    heat_point = 0,
    humidity_point = 73,
})

minetest.register_biome({
    name = "glassified_desert",

    -- Strati del terreno emerso
    node_top = "nodes:glassified_sand",
    depth_top = 2,

    node_filler = "nodes:glassy_sand",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = -5,
    y_max = 20,

    -- PUNTI CLIMATICI
    heat_point = 80,
    humidity_point = 1,
})

minetest.register_biome({
    name = "glassified_desert_waters",

    -- Strati del terreno emerso
    node_top = "nodes:glassy_sand",
    depth_top = 1,

    node_filler = "nodes:glassy_sand",
    depth_filler = 2,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = -31000,
    y_max = 0,

    -- PUNTI CLIMATICI
    heat_point = 80,
    humidity_point = 1,
})

minetest.register_biome({
    name = "magic_lands",

    -- Strati del terreno emerso
    node_top = "nodes:dirt_with_magic_grass",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 31000,

    -- PUNTI CLIMATICI
    heat_point = 47,
    humidity_point = 57,
})

minetest.register_biome({
    name = "magnetic_isles",

    -- Strati del terreno emerso
    node_top = "nodes:dirt_with_grass",
    depth_top = 1,

    node_filler = "nodes:magnetite",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 31000,

    -- PUNTI CLIMATICI
    heat_point = 100,
    humidity_point = 100,
})

minetest.register_biome({
    name = "magnetic_isles_waters",

    -- Strati del terreno emerso
    node_top = "nodes:sand",
    depth_top = 4,

    node_filler = "nodes:magnetite",
    depth_filler = 3,

    node_stone = "nodes:stone",
    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = -31000,
    y_max = 0,

    -- PUNTI CLIMATICI
    heat_point = 100,
    humidity_point = 100,
})


minetest.register_biome({
    name = "obscure_lands",

    -- Strati del terreno emerso
    node_top = "nodes:dirt_with_obscure_grass",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",
    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 31000,

    -- PUNTI CLIMATICI
    heat_point = 50,
    humidity_point = 60,
})

minetest.register_biome({
    name = "ocean",

    -- Strati del terreno emerso
    node_top = "nodes:sand",
    depth_top = 1,

    node_filler = "nodes:sand",
    depth_filler = 3,

    node_stone = "nodes:stone",
    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = -31000,
    y_max = 0,

    -- PUNTI CLIMATICI
    heat_point = 40,
    humidity_point = 70,
})

minetest.register_biome({
    name = "permafrost",
    node_top = "nodes:dirt_with_snow",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 2,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 31000,
    heat_point = 5,
    humidity_point = 30,
})

minetest.register_biome({
    name = "plains",

    -- Strati del terreno emerso
    node_top = "nodes:dirt_with_grass",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 30,

    -- PUNTI CLIMATICI
    heat_point = 50,
    humidity_point = 50,
})

minetest.register_biome({
    name = "plains_waters",

    -- Strati del terreno emerso
    node_top = "nodes:sand",
    depth_top = 1,

    node_filler = "nodes:sand",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = -31000,
    y_max = 0,

    -- PUNTI CLIMATICI
    heat_point = 50,
    humidity_point = 50,
})

minetest.register_biome({
    name = "savanna",
    node_top = "nodes:dirt_with_dry_grass",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 31000,
    heat_point = 65,
    humidity_point = 38,
})

minetest.register_biome({
    name = "snowy_hills",
    node_dust = "nodes:snow",
    node_top = "nodes:dirt_with_snow",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 50,
    heat_point = 30,
    humidity_point = 60,
})

minetest.register_biome({
    name = "snowy_mountains",
    node_dust = "nodes:snow_block",
    node_top = "nodes:dirt_with_snow",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 20,
    y_max = 70,
    heat_point = 25,
    humidity_point = 65,
})

minetest.register_biome({
    name = "snowy_peaks",
    node_top = "nodes:snow_block",
    depth_top = 2,

    node_filler = "nodes:stone",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 50,
    y_max = 31000,
    heat_point = 20,
    humidity_point = 60,
})

minetest.register_biome({
    name = "taiga",
    node_dust = "nodes:snow",
    node_top = "nodes:dirt_with_snow",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 50,
    heat_point = 40,
    humidity_point = 70,
})

minetest.register_biome({
    name = "tundra",
    node_top = "nodes:dirt_with_red_grass",
    depth_top = 1,

    node_filler = "nodes:dirt",
    depth_filler = 3,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:saltwater_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 100,
    heat_point = 15,
    humidity_point = 50,
})

minetest.register_biome({
    name = "lavic_lands",
    node_dust = "nodes:ash",
    node_top = "nodes:burned_stone",
    depth_top = 1,

    node_filler = "nodes:burned_stone",
    depth_filler = 10,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:lava_source",
    -- ESTENSIONI VERTICALI
    y_min = 1,
    y_max = 31000,
    heat_point = 95,
    humidity_point = 4,
})

minetest.register_biome({
    name = "lavic_ocean",
    node_top = "nodes:burned_stone",
    depth_top = 1,

    node_filler = "nodes:burned_stone",
    depth_filler = 10,

    node_stone = "nodes:stone",

    -- NODO DELL'ACQUA
    node_water = "nodes:lava_source",
    -- ESTENSIONI VERTICALI
    y_min = -31000,
    y_max = 0,
    heat_point = 95,
    humidity_point = 4,
})

-- ============================================================
-- Decorations: spawn naturale dei 5 alberi nei biomi
-- ============================================================
-- Richiede il mod "plantlikes" (vedi mods/plantlikes/mod.conf, depends = mapgen).
-- I file schematic (.mts) vivono in mods/mapgen/schems/.

local mapgen_schems = minetest.get_modpath("mapgen") .. "/schems"

minetest.register_decoration({
    name = "plantlikes:blusk",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_magic_grass" },
    biomes = { "magic_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/blusk.mts",
    place_offset_y = -1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.0001,
})

minetest.register_decoration({
    name = "plantlikes:palm",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass" },
    biomes = { "magnetic_isles" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/palm.mts",
    place_offset_y = -1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.02,
})

minetest.register_decoration({
    name = "plantlikes:pine",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_snow", "nodes:snow_block" },
    biomes = { "snowy_hills" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/pine.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.020,
})

minetest.register_decoration({
    name = "plantlikes:spruce",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_snow" },
    biomes = { "taiga" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/spruce.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.020,
})

minetest.register_decoration({
    name = "plantlikes:spruce_small",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_snow" },
    biomes = { "taiga" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/spruce_small.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.004,
})

minetest.register_decoration({
    name = "plantlikes:weeping_willow",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_obscure_grass" },
    biomes = { "obscure_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/weeping_willow.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.002,
})

-- ============================================================
-- Decorations: alberi aggiuntivi (10 nuove specie)
-- ============================================================
-- Specie con variante _small: due decorations separate con fill_ratio
-- che riproducono il rapporto 75% small / 25% normale (qui 75 : 25).
-- Specie singole: una sola decoration.
-- I biomi qui sotto sono scelti "in stile logico"; modificabili a piacere.

-- acacia: savanna, singolo
minetest.register_decoration({
    name = "plantlikes:acacia",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_dry_grass" },
    biomes = { "savanna" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/acacia.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.002,
})

-- apple: plains, singolo
minetest.register_decoration({
    name = "plantlikes:apple",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass" },
    biomes = { "plains", "forest" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/apple.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.001,
})

-- birch: forest, doppio (75% small / 25% normale)
minetest.register_decoration({
    name = "plantlikes:birch",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_magic_grass" },
    biomes = { "magic_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/birch.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.001,
})
minetest.register_decoration({
    name = "plantlikes:birch_small",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass" },
    biomes = { "forest" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/birch_small.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.003,
})

-- ebony: ebony_forest, singolo
minetest.register_decoration({
    name = "plantlikes:ebony",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_dry_grass" },
    biomes = { "ebony_forest" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/ebony.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.003,
})

-- frostwood: snowy_peaks/snowy_mountains, doppio (75% small / 25% normale)
minetest.register_decoration({
    name = "plantlikes:frostwood",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_snow" },
    biomes = { "permafrost" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/frostwood.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.001,
})
minetest.register_decoration({
    name = "plantlikes:frostwood_small",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_snow" },
    biomes = { "permafrost" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/frostwood_small.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.003,
})

-- lemon: magic_lands, singolo
minetest.register_decoration({
    name = "plantlikes:lemon",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_dry_grass" },
    biomes = { "savanna" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/lemon.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.0002,
})

-- oak: plains/forest, doppio (75% small / 25% normale)
minetest.register_decoration({
    name = "plantlikes:oak",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass" },
    biomes = { "plains", "forest" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/oak.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.002,
})
minetest.register_decoration({
    name = "plantlikes:oak_small",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass" },
    biomes = { "plains", "forest" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/oak_small.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.006,
})

minetest.register_decoration({
    name = "plantlikes:obscure_oak",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_obscure_grass" },
    biomes = { "obscure_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/obscure_oak.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.020,
})

-- poplar: plains, doppio (75% small / 25% normale)
minetest.register_decoration({
    name = "plantlikes:poplar",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass", "nodes:dirt_with_magic_grass" },
    biomes = { "forest", "magic_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/poplar.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.0005,
})
minetest.register_decoration({
    name = "plantlikes:poplar_small",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass", "nodes:dirt_with_magic_grass" },
    biomes = { "plains" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/poplar_small.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.001,
})

-- willow: forest, doppio (75% small / 25% normale)
minetest.register_decoration({
    name = "plantlikes:willow",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_magic_grass" },
    biomes = { "magic_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/willow.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.002,
})
minetest.register_decoration({
    name = "plantlikes:willow_small",
    deco_type = "schematic",
    place_on = { "nodes:dirt_with_grass" },
    biomes = { "forest" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/willow_small.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.003,
})

-- burned: solo decoration in lavic_lands (nessun sapling), doppio (75% small / 25%)
minetest.register_decoration({
    name = "plantlikes:burned",
    deco_type = "schematic",
    place_on = { "nodes:burned_stone" },
    biomes = { "lavic_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/burned.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.0005,
})
minetest.register_decoration({
    name = "plantlikes:burned_small",
    deco_type = "schematic",
    place_on = { "nodes:burned_stone" },
    biomes = { "lavic_lands" },
    y_min = 1, y_max = 100,
    schematic = mapgen_schems .. "/burned_small.mts",
    place_offset_y = 1,
    flags = "place_center_x, place_center_z",
    rotation = "random",
    fill_ratio = 0.0009,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:coal_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 9,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:coal_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 8,
    clust_size     = 3,
    y_max          = 64,
    y_min          = -127,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:coal_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 12 * 12 * 12,
    clust_num_ores = 30,
    clust_size     = 5,
    y_max          = -128,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:tin_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 10 * 10 * 10,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:tin_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = 64,
    y_min          = -127,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:tin_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 10 * 10 * 10,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -128,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:copper_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 9 * 9 * 9,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:copper_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 12 * 12 * 12,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -12,
    y_min          = -100,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:copper_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 9 * 9 * 9,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -128,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:iron_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 9 * 9 * 9,
    clust_num_ores = 12,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:iron_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 7 * 7 * 7,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -30,
    y_min          = -150,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:iron_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 12 * 12 * 12,
    clust_num_ores = 29,
    clust_size     = 5,
    y_max          = -151,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:gold_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 13 * 13 * 13,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:gold_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 3,
    clust_size     = 2,
    y_max          = -30,
    y_min          = -150,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:gold_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 13 * 13 * 13,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -151,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:silver_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 13 * 13 * 13,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:silver_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 3,
    clust_size     = 2,
    y_max          = -30,
    y_min          = -150,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:silver_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 13 * 13 * 13,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -151,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:mithril_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 26 * 26 * 26,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:mithril_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 30 * 30 * 30,
    clust_num_ores = 3,
    clust_size     = 2,
    y_max          = -30,
    y_min          = -150,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:mithril_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 29 * 29 * 29,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -151,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:orcish_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 20 * 20 * 20,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:orcish_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 20 * 20 * 20,
    clust_num_ores = 3,
    clust_size     = 2,
    y_max          = -40,
    y_min          = -140,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:orcish_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 17 * 17 * 17,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -141,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:tungsten_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 20 * 20 * 20,
    clust_num_ores = 2,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:tungsten_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 20 * 20 * 20,
    clust_num_ores = 3,
    clust_size     = 2,
    y_max          = -50,
    y_min          = -140,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:tungsten_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 17 * 17 * 17,
    clust_num_ores = 5,
    clust_size     = 3,
    y_max          = -141,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:diamond_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:diamond_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 17 * 17 * 17,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = -50,
    y_min          = -65,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:diamond_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = -66,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:black_diamond_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 30 * 30 * 30,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = 1025,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:black_diamond_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 34 * 34 * 34,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = -80,
    y_min          = -100,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:black_diamond_ore",
    wherein        = "nodes:stone",
    clust_scarcity = 30 * 30 * 30,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = -101,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:turquoise_ore",
    wherein        = "nodes:glassy_sand",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = -31000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nodes:obsidian",
    wherein        = "nodes:burned_stone",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 4,
    clust_size     = 3,
    y_max          = 31000,
    y_min          = -31000,
})

