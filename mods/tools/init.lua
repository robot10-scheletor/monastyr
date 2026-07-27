-- Tempi per livello di durezza (scala 1..10):
-- livello 1 = durissimo, livello 10 = morbidissimo.
-- Valori più bassi = scavo più veloce rispetto alla mano,
-- ma non istantanei: si vuole "sentire" la durezza.
local admin_times = {
    [1]  = 3.50,   -- durissimo (es. stone)
    [2]  = 3.00,
    [3]  = 2.50,
    [4]  = 2.00,
    [5]  = 1.60,
    [6]  = 1.30,
    [7]  = 1.00,
    [8]  = 0.80,
    [9]  = 0.60,
    [10] = 0.40,   -- morbidissimo (es. foglie)
}

-- Capacità per ogni gruppo di scavo.
-- "maxlevel = 10" permette di scavare nodi fino a livello 10
-- (la scala completa del game).
local admin_caps = {
    times    = admin_times,
    uses     = 0,       -- 0 = infinita (non si consuma mai)
    maxlevel = 10,
}

-- Registrazione dell'Admin Tool come strumento "normale":
-- compare in creative inventory e si crafta/ottiene come gli altri.
minetest.register_tool("tools:admin_tool", {
    description = "Admin Tool",
                       -- inventory_image: da aggiungere in seguito se si vuole un'icona
                       -- inventory_image = "admin_tool.png",
                       tool_capabilities = {
                           full_punch_interval = 0.5,
                           max_drop_level      = 3,
                           groupcaps = {
                               cracky                  = admin_caps,
                               crumbly                 = admin_caps,
                               snappy                  = admin_caps,
                               choppy                  = admin_caps,
                               fleshy                  = admin_caps,
                               oddly_breakable_by_hand = admin_caps,
                           },
                           damage_groups = { fleshy = 1 },
                       },
})
