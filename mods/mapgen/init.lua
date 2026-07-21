minetest.register_biome({
    name = "magnetic_isles",

    -- Strati del terreno
    node_top = "nodes:magnetite",       -- Superficie gialla
    depth_top = 1,

    node_filler = "nodes:stone",        -- Sotto la magnetite c'è la pietra
    depth_filler = 3,

    node_stone = "nodes:stone",         -- Pietra di base del mondo

    -- ESTENSIONI VERTICALI (Copriamo tutto, da sotto l'oceano al cielo)
    y_min = -31000,
    y_max = 31000,

-- PUNTI CLIMATICI UNIVERSALI
-- Impostando i punti centrali (50) e non specificando altri biomi,
                        -- questo bioma attirerà a sé tutte le coordinate di temperatura e umidità.
    heat_point = 50,
    humidity_point = 50,
})
