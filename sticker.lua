SMODS.Sticker {
    key = "fatass",
    loc_txt = {
        ['name'] = 'Weighty',
        ['text'] = {
            [1] = '-0.5 Hand Size while held'
        },
    },
    badge_colour = HEX 'c75985',
    needs_enable_flag = true,
    rate = 0.15,
    atlas = 'weightysticker',
    pos = { x = 0, y = 0 },
    config = { h_size = -1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.h_size} }
    end,
    
}

