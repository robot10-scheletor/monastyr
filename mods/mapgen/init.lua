
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
    depth_top = 2,

    node_filler = "nodes:sand",
    depth_filler = 3,

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
