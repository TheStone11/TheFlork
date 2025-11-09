SMODS.Joker{ --Joki
    key = "joki",
    config = {
        extra = {
            xchips = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Joki',
        ['text'] = {
            [1] = '{X:chips,C:white}X1.2{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips
            }
        end
    end
}