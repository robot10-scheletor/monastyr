-- plantlikes/init.lua
-- Registra i sapling delle specie che hanno lo schematic in mods/mapgen/schems,
-- gestisce la crescita da sapling tramite ABM con probabilita' 75% _small / 25% normale
-- (quando esiste la variante _small), e applica il leafdecay alle foglie
-- (group:leaves) quando i tronchi (group:tree) vengono rimossi.
-- Adattato da default/trees.lua di Minetest Game.

plantlikes = {}
local random = math.random

-- ============================================================
-- 1) Registrazione dei sapling
-- ============================================================
-- groups = {snappy=2, sapling=1, soil=1, ...} come nel default game,
-- cosi' possono essere raccolti e sono "buildable_to" per poter
-- essere piazzati dove appoggi.

local SAPLINGS = {
    -- Specie con variante _small (75/25)
    { nodename = "plantlikes:birch_sapling",          description = "Birch Sapling",          texture = "birch_sapling.png" },
    { nodename = "plantlikes:frostwood_sapling",      description = "Frostwood Sapling",      texture = "frostwood_sapling.png" },
    { nodename = "plantlikes:oak_sapling",            description = "Oak Sapling",            texture = "oak_sapling.png" },
    { nodename = "plantlikes:poplar_sapling",         description = "Poplar Sapling",         texture = "poplar_sapling.png" },
    { nodename = "plantlikes:spruce_sapling",         description = "Spruce Sapling",         texture = "spruce_sapling.png" },
    { nodename = "plantlikes:willow_sapling",         description = "Willow Sapling",         texture = "willow_sapling.png" },

    -- Specie con schematic singolo
    { nodename = "plantlikes:acacia_sapling",         description = "Acacia Sapling",         texture = "acacia_sapling.png" },
    { nodename = "plantlikes:apple_tree_sapling",     description = "Apple Tree Sapling",     texture = "apple_tree_sapling.png" },
    { nodename = "plantlikes:blusk_sapling",          description = "Blusk Sapling",          texture = "blusk_sapling.png" },
    { nodename = "plantlikes:ebony_sapling",          description = "Ebony Sapling",          texture = "ebony_sapling.png" },
    { nodename = "plantlikes:lemon_tree_sapling",     description = "Lemon Tree Sapling",     texture = "lemon_tree_sapling.png" },
    { nodename = "plantlikes:obscure_oak_sapling",    description = "Obscure Oak Sapling",    texture = "obscure_oak_sapling.png" },
    { nodename = "plantlikes:palm_sapling",           description = "Palm Sapling",           texture = "palm_sapling.png" },
    { nodename = "plantlikes:pine_sapling",           description = "Pine Sapling",           texture = "pine_sapling.png" },
    { nodename = "plantlikes:weeping_willow_sapling", description = "Weeping Willow Sapling", texture = "weeping_willow_sapling.png" },
}

-- Suono "foglie" di default, se il mod default e' caricato.
local leaf_sound
if rawget(_G, "default") and type(default.node_sound_leaves_defaults) == "function" then
    leaf_sound = default.node_sound_leaves_defaults()
end

for _, s in ipairs(SAPLINGS) do
    minetest.register_node(":" .. s.nodename, {
        description = s.description,
        drawtype = "plantlike",
        visual_scale = 1.0,
        tiles = { s.texture },
        inventory_image = s.texture,
        wield_image = s.texture,
        paramtype = "light",
        sunlight_propagates = true,
        walkable = false,
        selection_box = {
            type = "fixed",
            fixed = { -0.3, -0.5, -0.3, 0.3, 0.35, 0.3 },
        },
        groups = {
            snappy = 2,
            sapling = 1,
            soil = 1,
            attached_node = 1,
            dig_immediate = 3,
            flammable = 2,
        },
        sounds = leaf_sound,
    })
end

-- ============================================================
-- 2) Crescita: condizioni, ABM, schematic placement (75/25 _small)
-- ============================================================

-- 'can grow' — richiede terreno con group:soil sotto e luce >= 13.
function plantlikes.can_grow(pos)
    local node_under = minetest.get_node_or_nil({ x = pos.x, y = pos.y - 1, z = pos.z })
    if not node_under then
        return false
    end
    if minetest.get_item_group(node_under.name, "soil") == 0 then
        return false
    end
    local light_level = minetest.get_node_light(pos)
    if not light_level or light_level < 13 then
        return false
    end
    return true
end

function plantlikes.on_grow_failed(pos)
    minetest.get_node_timer(pos):start(300)
end

-- Mappa sapling -> definizione di crescita.
--
-- Campi:
--   schem            file .mts "normale" in mods/mapgen/schems/
--   small_schem      (opzionale) file .mts variante _small
--   small_offset     (opzionale) offset specifico per la variante _small
--                    (se assente, si usa `offset` anche per _small)
--   offset           offset x,y,z rispetto al sapling
--   rotation         "random" o "0"
--   small_chance     (opzionale, default 75) probabilita' % di scegliere _small
--
-- Offset calcolati come (-floor(sx/2), -1, -floor(sz/2)) per centrare X,Z
-- e allineare Y alla base del tronco. Se in gioco l'albero e' "galleggiato"
-- o "interrato" di 1 nodo, basta modificare offset.y di +/-1.

local SCHEMATICS = {
    -- 1) Specie con variante _small -----------------------------------

    ["plantlikes:birch_sapling"] = {
        schem = "birch.mts",
        small_schem = "birch_small.mts",
        offset = { x = -3, y = -1, z = -4 },
        small_offset = { x = -2, y = -1, z = -2 },
        rotation = "random",
    },
    ["plantlikes:frostwood_sapling"] = {
        schem = "frostwood.mts",
        small_schem = "frostwood_small.mts",
        offset = { x = -2, y = -1, z = -2 },
        small_offset = { x = -1, y = -1, z = -1 },
        rotation = "random",
    },
    ["plantlikes:oak_sapling"] = {
        schem = "oak.mts",
        small_schem = "oak_small.mts",
        offset = { x = -4, y = -1, z = -5 },
        small_offset = { x = -2, y = -1, z = -2 },
        rotation = "random",
    },
    ["plantlikes:poplar_sapling"] = {
        schem = "poplar.mts",
        small_schem = "poplar_small.mts",
        offset = { x = -2, y = -1, z = -2 },
        small_offset = { x = -2, y = -1, z = -2 },
        rotation = "random",
    },
    ["plantlikes:spruce_sapling"] = {
        schem = "spruce.mts",
        small_schem = "spruce_small.mts",
        offset = { x = -3, y = -1, z = -3 },
        small_offset = { x = -2, y = -1, z = -2 },
        rotation = "random",
    },
    ["plantlikes:willow_sapling"] = {
        schem = "willow.mts",
        small_schem = "willow_small.mts",
        offset = { x = -4, y = -1, z = -4 },
        small_offset = { x = -3, y = -1, z = -2 },
        rotation = "random",
    },

    -- 2) Specie con schematic singolo ----------------------------------

    ["plantlikes:acacia_sapling"] = {
        schem = "acacia.mts",
        offset = { x = -3, y = -1, z = -3 },
        rotation = "random",
    },
    ["plantlikes:apple_tree_sapling"] = {
        schem = "apple.mts",
        offset = { x = -2, y = -1, z = -2 },
        rotation = "random",
    },
    ["plantlikes:blusk_sapling"] = {
        schem = "blusk.mts",
        offset = { x = -3, y = -1, z = -3 },
        rotation = "random",
    },
    ["plantlikes:ebony_sapling"] = {
        schem = "ebony.mts",
        offset = { x = -3, y = -1, z = -3 },
        rotation = "random",
    },
    ["plantlikes:lemon_tree_sapling"] = {
        schem = "lemon.mts",
        offset = { x = -2, y = -1, z = -3 },
        rotation = "random",
    },
    ["plantlikes:obscure_oak_sapling"] = {
        schem = "obscure_oak.mts",
        offset = { x = -4, y = -1, z = -3 },
        rotation = "random",
    },
    ["plantlikes:palm_sapling"] = {
        schem = "palm.mts",
        offset = { x = -5, y = -1, z = -5 },
        rotation = "random",
    },
    ["plantlikes:pine_sapling"] = {
        schem = "pine.mts",
        offset = { x = -2, y = -1, z = -2 },
        rotation = "random",
    },
    ["plantlikes:weeping_willow_sapling"] = {
        schem = "weeping_willow.mts",
        offset = { x = -4, y = -1, z = -4 },
        rotation = "random",
    },
}

-- Sceglie quale schematic usare per una data specie.
-- Se esiste la variante _small, la sceglie con probabilita' small_chance% (default 75).
-- Ritorna (nome_file, offset).
local function pick_schematic(def)
    if def.small_schem then
        local chance = def.small_chance or 75
        if random(1, 100) <= chance then
            return def.small_schem, def.small_offset or def.offset
        end
    end
    return def.schem, def.offset
end

function plantlikes.grow_sapling(pos, node)
    if not plantlikes.can_grow(pos) then
        plantlikes.on_grow_failed(pos)
        return
    end

    local def = SCHEMATICS[node.name]
    if not def then
        minetest.log("warning", "[plantlikes] No schematic mapping for " .. node.name)
        return
    end

    local schem_file, off = pick_schematic(def)
    local schem_path = minetest.get_modpath("mapgen") .. "/schems/" .. schem_file
    local place_pos = {
        x = pos.x + off.x,
        y = pos.y + off.y,
        z = pos.z + off.z,
    }

    minetest.log("action", "[plantlikes] Growing " .. node.name ..
        " at " .. minetest.pos_to_string(pos) .. " using " .. schem_file)

    minetest.place_schematic(place_pos, schem_path, def.rotation, nil, false)
end

-- ABM: ogni ~20s (interval 10 * chance 50%) controlla se un sapling
-- e' pronto per crescere.
for nodename, _ in pairs(SCHEMATICS) do
    minetest.register_abm({
        nodenames = { nodename },
        interval = 10,
        chance = 50,
        action = function(pos, node)
            plantlikes.grow_sapling(pos, node)
        end,
    })
end

-- ============================================================
-- 3) Leafdecay
-- ============================================================
-- Quando un tronco (group:tree) sparisce, le foglie (group:leaves)
-- adiacenti decadono entro pochi secondi, come nel default game.

minetest.register_abm({
    nodenames = { "group:leaves" },
    interval = 2,
    chance = 5,
    action = function(pos, node)
        -- 1) Se c'e' almeno un tronco (group:tree) entro 1 nodo, resta.
        for _, off in ipairs({
            { x =  1, y =  0, z =  0 },
            { x = -1, y =  0, z =  0 },
            { x =  0, y =  0, z =  1 },
            { x =  0, y =  0, z = -1 },
            { x =  0, y =  1, z =  0 },
            { x =  0, y = -1, z =  0 },
        }) do
            local p = { x = pos.x + off.x, y = pos.y + off.y, z = pos.z + off.z }
            local n = minetest.get_node(p)
            if n and n.name ~= "ignore" and n.name ~= "air" and
                    minetest.get_item_group(n.name, "tree") > 0 then
                return
            end
        end

        -- 2) Altrimenti, se e' "isolata" (nessuna foglia adiacente), sparisce.
        for _, off in ipairs({
            { x =  1, y =  0, z =  0 },
            { x = -1, y =  0, z =  0 },
            { x =  0, y =  0, z =  1 },
            { x =  0, y =  0, z = -1 },
            { x =  0, y = -1, z =  0 },
        }) do
            local p = { x = pos.x + off.x, y = pos.y + off.y, z = pos.z + off.z }
            local n = minetest.get_node(p)
            if n and minetest.get_item_group(n.name, "leaves") > 0 then
                return  -- appoggiata a un'altra foglia, resta
            end
        end

        minetest.remove_node(pos)
    end,
})

minetest.log("action", "[plantlikes] Mod loaded: 15 saplings, ABM growth (75/25 _small), leafdecay enabled.")
