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

minetest.register_craftitem("craftitems:black_diamond", {
    description = "Black Diamond",
    inventory_image = "black_diamond.png"
})

minetest.register_craftitem("craftitems:bronze_ingot", {
    description = "Bronze Ingot",
    inventory_image = "bronze_ingot.png"
})

minetest.register_craftitem("craftitems:coal", {
    description = "Coal",
    inventory_image = "coal.png"
})

minetest.register_craftitem("craftitems:copper", {
    description = "Copper",
    inventory_image = "copper.png"
})

minetest.register_craftitem("craftitems:copper_ingot", {
    description = "Copper Ingot",
    inventory_image = "copper_ingot.png"
})

minetest.register_craftitem("craftitems:diamond", {
    description = "Diamon",
    inventory_image = "diamond.png"
})

minetest.register_craftitem("craftitems:gold", {
    description = "Gold",
    inventory_image = "gold.png"
})

minetest.register_craftitem("craftitems:gold_ingot", {
    description = "Gold Ingot",
    inventory_image = "gold_ingot.png"
})

minetest.register_craftitem("craftitems:iron", {
    description = "Iron",
    inventory_image = "iron.png"
})

minetest.register_craftitem("craftitems:iron_ingot", {
    description = "Iron Ingot",
    inventory_image = "iron_ingot.png"
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

minetest.register_craftitem("craftitems:mithril", {
    description = "Mithril",
    inventory_image = "mithril.png"
})

minetest.register_craftitem("craftitems:mithril_ingot", {
    description = "Mithril Ingot",
    inventory_image = "mithril_ingot.png"
})

minetest.register_craftitem("craftitems:orcish", {
    description = "Orcish Ore",
    inventory_image = "orcish.png"
})

minetest.register_craftitem("craftitems:orcish_ingot", {
    description = "Orcish Ore Ingot",
    inventory_image = "orcish_ingot.png"
})

minetest.register_craftitem("craftitems:silver", {
    description = "Silver",
    inventory_image = "silver.png"
})

minetest.register_craftitem("craftitems:silver_ingot", {
    description = "Silver Ingot",
    inventory_image = "silver_ingot.png"
})

minetest.register_craftitem("craftitems:steel_ingot", {
    description = "Steel Ingot",
    inventory_image = "steel_ingot.png"
})

minetest.register_craftitem("craftitems:stick", {
    description = "Stick",
    inventory_image = "stick.png"
})

minetest.register_craftitem("craftitems:tin", {
    description = "Tin",
    inventory_image = "tin.png"
})


minetest.register_craftitem("craftitems:tin_ingot", {
    description = "Tin Ingot",
    inventory_image = "tin_ingot.png"
})

minetest.register_craftitem("craftitems:tungsten", {
    description = "Tungsten",
    inventory_image = "tungsten.png"
})


minetest.register_craftitem("craftitems:tungsten_ingot", {
    description = "Tungsten Ingot",
    inventory_image = "tungsten_ingot.png"
})

minetest.register_craftitem("craftitems:turquoise", {
    description = "Turquoise",
    inventory_image = "turquoise.png"
})
