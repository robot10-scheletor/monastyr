-- slabs mod: auto-generates half-height slabs for every suitable node
-- registered by the "nodes" mod. The slab of a block "X" is registered as
-- "slabs:X_slab" (e.g. slabs:stone_slab for nodes:stone).

-- Drawtypes that don't make sense as a slab (liquids, leaves, air, custom
-- meshes, custom-shaped nodeboxes, etc.) — we skip them so we don't break
-- or duplicate their visuals.
local DISALLOWED_DRAWTYPES = {
    ["airlike"]                    = true,
    ["liquid"]                     = true,
    ["flowingliquid"]              = true,
    ["allfaces_optional"]          = true,  -- leaves
    ["allfaces"]                   = true,
    -- glasslike/glasslike_framed: handled by the dedicated glass path,
    -- not skipped. If a future glass node is added without being listed
    -- in GLASS_LIKE_SOURCES, uncomment the lines below to fall back to
    -- the generic skip behaviour.
    -- ["glasslike"]                = true,
    -- ["glasslike_framed"]         = true,
    -- ["glasslike_framed_optional"]= true,
    ["fire"]                       = true,
    ["mesh"]                       = true,  -- meshes would shrink unpredictably
    ["none"]                       = true,
    ["nodebox"]                    = true,  -- custom-shaped nodes (ash, snow) have their own height
}

-- Source modprefixes we generate slabs for. Currently only "nodes:".
local SOURCE_PREFIXES = { "nodes:" }

-- "Glass-like" source blocks: they need a special slab that keeps
-- transparency and lets sunlight through. We register them by hand
-- instead of going through the generic path. Add more entries here
-- as new transparent nodes are introduced in the "nodes" mod.
local GLASS_LIKE_SOURCES = {
    ["nodes:ice"]             = true,
    ["nodes:glassified_sand"] = true,
}

-- Standard 1x0.5x1 nodebox for the slab (1 node wide, half a node tall).
-- Vertices go from -0.5,-0.5,-0.5 to 0.5,0,0.5 so the slab sits on the
-- lower half of a full block.
local SLAB_BOX = {
    type  = "fixed",
    fixed = { -0.5, -0.5, -0.5, 0.5, 0.0, 0.5 },
}

local function starts_with(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end

-- Build a clean groups table for the slab: keep the original groups,
-- add "slab=1" and drop anything that would conflict with slab behavior.
local function derive_groups(orig_groups)
    local g = {}
    if type(orig_groups) == "table" then
        for k, v in pairs(orig_groups) do
            g[k] = v
        end
    end
    g.slab = 1
    return g
end

-- Register a "glass-like" slab: half-height nodebox for visual+collision,
-- with transparency (alpha blend) and sunlight propagation so the slab
-- behaves like its glass-like source block (ice, glassified_sand).
local function register_glass_like_slab(source_name, source_def)
    local slab_name = "slabs:" .. string.sub(source_name, #"nodes:" + 1) .. "_slab"

    if minetest.registered_nodes[slab_name] then
        return
    end

    local tiles = source_def.tiles or { source_name .. ".png" }
    local def = {
        description      = (source_def.description or source_name) .. " Slab",
        tiles            = tiles,
        -- "nodebox" so the engine actually renders the half-height box.
        drawtype         = "nodebox",
        -- Needed for sunlight_propagates and the alpha blend to work.
        paramtype        = "light",
        paramtype2       = "facedir",
        groups           = derive_groups(source_def.groups),
        node_box         = SLAB_BOX,
        collision_box    = SLAB_BOX,
        selection_box    = SLAB_BOX,
        is_ground_content = false,
        on_place         = minetest.rotate_node,
        -- Glass-like behaviour: alpha-blended texture + light passes through.
        use_texture_alpha = "blend",
        sunlight_propagates = true,
        -- 127 ~= 50% opaque, matches Minetest's default "glasslike" look.
        -- Tweak per-node if you want a more frosted/clear appearance.
        alpha = source_def.alpha or 127,
    }

    minetest.register_node(slab_name, def)

    -- Same crafting recipes as ordinary slabs.
    minetest.register_craft({
        output = source_name .. " 1",
        recipe = {
            { slab_name, slab_name },
        },
    })
    minetest.register_craft({
        output = slab_name .. " 2",
        recipe = {
            { source_name },
        },
    })
end

-- Register a single slab node, mirroring the visual definition of the
-- source block (description, tiles) but with a half-height nodebox.
local function register_slab(source_name, source_def)
    local slab_name = "slabs:" .. string.sub(source_name, #"nodes:" + 1) .. "_slab"

    -- Avoid double registration if this mod is reloaded.
    if minetest.registered_nodes[slab_name] then
        return
    end

    local def = {
        description      = (source_def.description or source_name) .. " Slab",
        tiles            = source_def.tiles,
        -- "nodebox" is required so the engine renders the slab using
        -- SLAB_BOX (half a node tall). "normal" would always draw a
        -- full 1x1x1 cube regardless of the node_box definition.
        drawtype         = "nodebox",
        paramtype        = "light",
        paramtype2       = "facedir",
        groups           = derive_groups(source_def.groups),
        node_box         = SLAB_BOX,
        collision_box    = SLAB_BOX,
        selection_box    = SLAB_BOX,
        is_ground_content = false,
        on_place         = minetest.rotate_node,
    }

    -- Preserve sunlight_propagates for source nodes that want light to
    -- pass through (e.g. glassified_sand, ice). Drops naturally on dig.
    if source_def.sunlight_propagates ~= nil then
        def.sunlight_propagates = source_def.sunlight_propagates
    end

    minetest.register_node(slab_name, def)

    -- Crafting recipes:
    --   3 slabs  -> 1 full block
    --   1 block  -> 2 slabs
    minetest.register_craft({
        output = source_name .. " 1",
        recipe = {
            { slab_name, slab_name },
        },
    })

    minetest.register_craft({
        output = slab_name .. " 2",
        recipe = {
            { source_name },
        },
    })
end

-- Run at the end of this mod's init.lua. Because we declare
-- "depends = nodes" in mod.conf, the "nodes" mod is loaded BEFORE us,
-- so all its nodes are already in minetest.registered_nodes here.
-- We intentionally do NOT use register_on_mods_loaded: that callback
-- runs when no mod is "current" anymore, so core.get_current_modname()
-- returns "" and the engine rejects any "slabs:..." registration with
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

    -- Glass-like source blocks: handle via the dedicated path so we
    -- keep transparency + sunlight_propagates.
    if GLASS_LIKE_SOURCES[name] then
        register_glass_like_slab(name, def)
        goto continue
    end

    local drawtype = def.drawtype or "normal"
    if DISALLOWED_DRAWTYPES[drawtype] then
        goto continue
    end

    register_slab(name, def)
    ::continue::
end
