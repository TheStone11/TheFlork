
SMODS.Joker{ --Bingus
    key = "bingus",
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Bingus',
        ['text'] = {
            [1] = '{C:attention}Wild{} cards give {X:blue,C:white}X3{} Chips when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    x_chips = 3
                }
            end
        end
    end
}