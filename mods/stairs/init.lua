-- stairs mod: auto-generates three stair shapes (normal, inner, outer) for
-- every suitable node registered by the "nodes" mod. The stair of a block
-- "X" is registered as:
--   stairs:X_stair          (normal step, default mtg shape)
--   stairs:X_inner_stair    (concave inner corner)
--   stairs:X_outer_stair    (convex outer corner)
-- For example nodes:stone produces stairs:stone_stair, stairs:stone_inner_stair,
-- stairs:stone_outer_stair. Stair nodeboxes, rotate_and_place helper and
-- crafting recipes are modelled after minetest_game/mods/stairs/init.lua.

-- Drawtypes that don't make sense as a stair (liquids, leaves, air, custom
-- meshes, custom-shaped nodeboxes, etc.) — we skip them so we don't break
-- or duplicate their visuals.
local DISALLOWED_DRAWTYPES = {
    ["airlike"]                    = true,
    ["liquid"]                     = true,
    ["flowingliquid"]              = true,
    ["allfaces_optional"]          = true,  -- leaves
    ["allfaces"]                   = true,
    -- glasslike: handled by the dedicated glass path below, not skipped.
    -- If a future glass node is added without being listed in
    -- GLASS_LIKE_SOURCES, uncomment the lines below to fall back to skip.
    -- ["glasslike"]                = true,
    -- ["glasslike_framed"]         = true,
    -- ["glasslike_framed_optional"]= true,
    ["fire"]                       = true,
    ["mesh"]                       = true,  -- meshes would deform unpredictably
    ["none"]                       = true,
    ["nodebox"]                    = true,  -- custom-shaped nodes have their own height
    ["signlike"]                    = true,
}

-- Source modprefixes we generate stairs for. Currently only "nodes:".
local SOURCE_PREFIXES = { "nodes:" }

-- "Glass-like" source blocks: they need stairs that keep transparency and
-- let sunlight through. We register them by hand via the dedicated path.
local GLASS_LIKE_SOURCES = {
    ["nodes:ice"]             = true,
    ["nodes:glassified_sand"] = true,
}

-- Step-shaped nodeboxes (same geometry as Minetest Game).
local STAIR_BOX = {
    type  = "fixed",
    fixed = {
        {-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},  -- lower half, full 1x1 footprint
        {-0.5,  0.0,  0.0, 0.5, 0.5, 0.5},  -- upper step (back half of the block)
    },
}
local STAIR_BOX_INNER = {
    type  = "fixed",
    fixed = {
        {-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},  -- lower half, full
        {-0.5,  0.0,  0.0, 0.5, 0.5, 0.5},  -- upper step, back half
        {-0.5,  0.0, -0.5, 0.0, 0.5, 0.0},  -- upper step, front-left quarter (inner corner)
    },
}
local STAIR_BOX_OUTER = {
    type  = "fixed",
    fixed = {
        {-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},  -- lower half, full
        {-0.5,  0.0,  0.0, 0.0, 0.5, 0.5},  -- only the left edge of the upper step (outer corner)
    },
}

-- Map from internal variant id to (node_suffix, description suffix).
local VARIANTS = {
    {
        id          = "stair",
        node_suffix = "stair",
        description = "Stair",
        node_box    = STAIR_BOX,
        recipe      = {
            {"", "", true},
            {"", true, true},
            {true, true, true},
        },
        output_count = 8,
    },
    {
        id          = "inner_stair",
        node_suffix = "inner_stair",
        description = "Inner Stair",
        node_box    = STAIR_BOX_INNER,
        recipe      = {
            {"", true, ""},
            {true, "", true},
            {true, true, true},
        },
        output_count = 7,
    },
    {
        id          = "outer_stair",
        node_suffix = "outer_stair",
        description = "Outer Stair",
        node_box    = STAIR_BOX_OUTER,
        recipe      = {
            {"", true, ""},
            {true, true, true},
        },
        output_count = 6,
    },
}

local function starts_with(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end

-- Build a clean groups table for the stair: keep the original groups,
-- add "stair=1" so other mods can target stairs by group.
local function derive_groups(orig_groups)
    local g = {}
    if type(orig_groups) == "table" then
        for k, v in pairs(orig_groups) do
            g[k] = v
        end
    end
    g.stair = 1
    return g
end

-- rotate_and_place: choose the right param2 (facedir) so the stair orients
-- towards the placer, and flip it upside-down (param2 >= 20) when placed
-- against the underside of a node. Adapted from Minetest Game.
local function rotate_and_place(itemstack, placer, pointed_thing)
    local p0 = pointed_thing.under
    local p1 = pointed_thing.above
    local param2 = 0

    if placer then
        local placer_pos = placer:get_pos()
        if placer_pos then
            local diff = vector.subtract(p1, placer_pos)
            param2 = minetest.dir_to_facedir(diff)

            -- Player clicked the side face of the node they're standing on:
            -- reverse the stair direction.
            if p0.y == p1.y and math.abs(diff.x) <= 0.5 and math.abs(diff.z) <= 0.5 and diff.y < 0 then
                param2 = (param2 + 2) % 4
            end
        end

        local finepos = minetest.pointed_thing_to_face_pos(placer, pointed_thing)
        local fpos = finepos.y % 1

        -- Placing against a ceiling: flip the stair upside down.
        if p0.y - 1 == p1.y or (fpos > 0 and fpos < 0.5)
                or (fpos < -0.5 and fpos > -0.999999999) then
            param2 = param2 + 20
            if param2 == 21 then
                param2 = 23
            elseif param2 == 23 then
                param2 = 21
            end
        end
    end
    return minetest.item_place(itemstack, placer, pointed_thing, param2)
end

-- on_place callback shared by every stair variant.
local function stair_on_place(itemstack, placer, pointed_thing)
    if pointed_thing.type ~= "node" then
        return itemstack
    end
    return rotate_and_place(itemstack, placer, pointed_thing)
end

-- Build the core node def (shared fields) for a stair variant.
local function make_stair_def(source_def, node_box, description_suffix)
    local tiles = source_def.tiles or { (source_def.description or "") .. ".png" }
    local def = {
        description      = (source_def.description or "") .. " " .. description_suffix,
        tiles            = tiles,
        drawtype         = "nodebox",
        paramtype        = "light",
        paramtype2       = "facedir",
        groups           = derive_groups(source_def.groups),
        node_box         = node_box,
        collision_box    = node_box,
        selection_box    = node_box,
        is_ground_content = false,
        on_place         = stair_on_place,
    }

    -- Preserve sunlight_propagates for source nodes that want light to
    -- pass through. Drops naturally on dig.
    if source_def.sunlight_propagates ~= nil then
        def.sunlight_propagates = source_def.sunlight_propagates
    end
    return def
end

-- Glass-like version of make_stair_def: alpha-blended + light permeable.
local function make_glass_stair_def(source_def, node_box, description_suffix)
    local def = make_stair_def(source_def, node_box, description_suffix)
    def.use_texture_alpha = "blend"
    def.sunlight_propagates = true
    -- 127 ~= 50% opaque; tweak per-node if you want a more frosted look.
    def.alpha = source_def.alpha or 127
    return def
end

-- Turn a recipe pattern (table of {true|""} cells) into a real crafting
-- grid by substituting `recipeitem` for every `true` cell.
local function materialize_recipe(pattern, recipeitem)
    local r = {}
    for i, row in ipairs(pattern) do
        r[i] = {}
        for j, cell in ipairs(row) do
            r[i][j] = cell == true and recipeitem or ""
        end
    end
    return r
end

-- Register one stair variant (normal / inner / outer) for a source block.
local function register_stair_variant(source_name, source_def, variant, is_glass)
    local stair_name = "stairs:" .. string.sub(source_name, #"nodes:" + 1)
        .. "_" .. variant.node_suffix

    if minetest.registered_nodes[stair_name] then
        return
    end

    local def
    if is_glass then
        def = make_glass_stair_def(source_def, variant.node_box, variant.description)
    else
        def = make_stair_def(source_def, variant.node_box, variant.description)
    end

    minetest.register_node(stair_name, def)

    -- Only the forward crafting recipe (blocks -> stairs), as requested.
    minetest.register_craft({
        output = stair_name .. " " .. variant.output_count,
        recipe = materialize_recipe(variant.recipe, source_name),
    })
end

-- Run at the end of this mod's init.lua. Because we declare
-- "depends = nodes" in mod.conf, the "nodes" mod is loaded BEFORE us,
-- so all its nodes are already in minetest.registered_nodes here.
-- We intentionally do NOT use register_on_mods_loaded: that callback
-- runs when no mod is "current" anymore, so core.get_current_modname()
-- returns "" and the engine rejects any "stairs:..." registration with
-- "Name ... does not follow naming conventions".
for name, def in pairs(minetest.registered_nodes) do
    local ok_prefix = false
    for _, prefix in ipairs(SOURCE_PREFIXES) do
        if starts_with(name, prefix) then
            ok_prefix = true
            break
        end
    end
    if not ok_prefix then
        goto continue
    end

    -- Skip entries without tiles (e.g. aliases, special nodes).
    if type(def.tiles) ~= "table" and type(def.tiles) ~= "string" then
        goto continue
    end

    -- Glass-like source blocks: handled via the dedicated glass path so we
    -- keep transparency + sunlight_propagates (skip the drawtype check).
    local is_glass = GLASS_LIKE_SOURCES[name] == true

    if not is_glass then
        local drawtype = def.drawtype or "normal"
        if DISALLOWED_DRAWTYPES[drawtype] then
            goto continue
        end
    end

    for _, variant in ipairs(VARIANTS) do
        register_stair_variant(name, def, variant, is_glass)
    end
    ::continue::
end
