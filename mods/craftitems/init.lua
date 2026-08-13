minetest.register_node("craftitems:apple", {
    description = "Apple",

    -- Uso della mesh personalizzata
    drawtype = "mesh",
    mesh = "apple.obj",

    -- Texture applicata alla mesh
    tiles = {"apple.png"},

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

minetest.register_node("craftitems:lemon", {
    description = "Lemon",

    -- Uso della mesh personalizzata
    drawtype = "mesh",
    mesh = "lemon.obj",

    -- Texture applicata alla mesh
    tiles = {"lemon.png"},

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

