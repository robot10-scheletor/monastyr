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
    y_max = 50,

    -- PUNTI CLIMATICI
    heat_point = 100,
    humidity_point = 0,
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
    heat_point = 30,
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
    heat_point = 30,
    humidity_point = 1,
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
    y_max = 20,

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
    name = "snowy_hills",

    -- Strati del terreno emerso
    node_dust = "default:snow",
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
