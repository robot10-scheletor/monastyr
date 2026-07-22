local S = minetest.get_translator and minetest.get_translator("default")
or function(s) return s end

-- Override the *engine*‑registered empty‑hand item.
-- The definition is **identical** a quella di default/tools.lua.
minetest.override_item("", {
    wield_scale = {x = 1, y = 1, z = 2.5},
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 0,
        groupcaps = {
            -- can dig dirt, sand… a normal hand‑speed
            crumbly = {times = {[2] = 3.00, [3] = 0.70}, uses = 0, maxlevel = 1},
            -- can break leaves, vines, etc.
            snappy  = {times = {[3] = 0.40}, uses = 0, maxlevel = 1},
            -- node‑specific “hand‑breakable” group (oddly_breakable_by_hand)
oddly_breakable_by_hand = {
    times = {[1] = 3.50, [2] = 2.00, [3] = 0.70},
    uses = 0
},
        },
        damage_groups = {fleshy = 1},
    },
    -- Manteniamo l’aspetto originale della mano (invisibile, non trasportabile)
groups = {not_in_creative_inventory = 1},
description = S("Hand"),
})
