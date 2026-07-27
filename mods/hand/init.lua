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
            -- Scala durezze 1..10: livello 1 = durissimo, livello 10 = morbidissimo
            -- Tempi di scavo a mano per nodi crumbly (terra, sabbia, ecc.)
            crumbly = {
                times = {
                    [1] = 5.00, [2] = 4.00, [3] = 3.00, [4] = 2.50,
                    [5] = 2.00, [6] = 1.50, [7] = 1.20, [8] = 1.00,
                    [9] = 0.85, [10] = 0.70,
                },
                uses = 0, maxlevel = 10,
            },
            -- Tempi di scavo a mano per nodi snappy (foglie, viti, ecc.)
            snappy = {
                times = {
                    [1] = 3.00, [2] = 2.00, [3] = 1.50, [4] = 1.00,
                    [5] = 0.80, [6] = 0.60, [7] = 0.50, [8] = 0.45,
                    [9] = 0.42, [10] = 0.40,
                },
                uses = 0, maxlevel = 10,
            },
            -- Gruppo "hand-breakable" dedicato (oddly_breakable_by_hand)
            oddly_breakable_by_hand = {
                times = {
                    [1] = 5.00, [2] = 3.50, [3] = 2.00, [4] = 1.50,
                    [5] = 1.20, [6] = 1.00, [7] = 0.85, [8] = 0.75,
                    [9] = 0.70, [10] = 0.50,
                },
                uses = 0,
            },
        },
        damage_groups = {fleshy = 1},
    },
    -- Manteniamo l’aspetto originale della mano (invisibile, non trasportabile)
    groups = {not_in_creative_inventory = 1},
    description = S("Hand"),
})
