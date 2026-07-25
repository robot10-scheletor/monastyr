local S = minetest.get_translator and minetest.get_translator("creative") or function(s)
return s end

-- 1. Privilegio “creative”
minetest.register_privilege("creative", {
    description = S("Allow player to use creative inventory"),
                            give_to_singleplayer = false,
                            give_to_admin = false,
})

-- 2. Override di minetest.is_creative_enabled
local old_is_creative_enabled = minetest.is_creative_enabled
function minetest.is_creative_enabled(name)
if name == "" then
    return old_is_creative_enabled(name)
    end
    return minetest.check_player_privs(name, {creative = true}) or
    old_is_creative_enabled(name)
    end

    -- 3. Quando il server è in modalità creativa,
--    sostituiamo la “hand” con una versione ultra‑veloce.
if minetest.is_creative_enabled("") then
    minetest.register_on_mods_loaded(function()
    local digtime = 42
    local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}
    minetest.override_item("", {
        range = 10,
        tool_capabilities = {
            full_punch_interval = 0.5,
            max_drop_level = 3,
            groupcaps = {
                crumbly = caps,
                cracky = caps,
                snappy = caps,
                choppy = caps,
                oddly_breakable_by_hand = caps,
                dig_immediate = {times = {[2] = digtime, [3] = 0},
                uses = 0, maxlevel = 256},
            },
            damage_groups = {fleshy = 10},
        },
    })
    end)
end

    -- 4. Posizionamento illimitato di blocchi in creative
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
    if placer and placer:is_player() then
    return minetest.is_creative_enabled(placer:get_player_name())
    end
end)

    -- 5. Drop dei nodi in creative → direttamente nell’inventario
local old_handle_node_drops = minetest.handle_node_drops
function minetest.handle_node_drops(pos, drops, digger)
    if not digger or not digger:is_player() or
        not minetest.is_creative_enabled(digger:get_player_name()) then
        return old_handle_node_drops(pos, drops, digger)
    end

local inv = digger:get_inventory()
    if inv then
        for _, item in ipairs(drops) do
            if not inv:contains_item("main", item, true) then
                inv:add_item("main", item)
            end
        end
    end
end
