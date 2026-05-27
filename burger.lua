SMODS.Stake {
    name = "Burger Stake",
    key = "burger",
    loc_txt = {
        ['name'] = 'Burger Stake',
        ['text'] = {
            [1] = 'Jokers in shop can be Weighty',
            [2] = 'Applies all previous steaks',
            [3] = 'Wait, steaks?'
        },
    },
    applied_stakes = { "gold" },
    atlas = 'burgerstake',
    pos = { x = 0, y = 0 },
    sticker_pos = { x = 0, y = 0 },
    modifiers = function()
        G.GAME.modifiers.enable_flynnset_fatass = true
    end,
    colour = G.C.ATTENTION
}