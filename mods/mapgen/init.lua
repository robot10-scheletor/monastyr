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
heat_point = 50,
humidity_point = 50,
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
    heat_point = 50,
    humidity_point = 50,
})
