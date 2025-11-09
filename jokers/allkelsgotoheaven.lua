SMODS.Joker{ --All Kels Go To Heaven
    key = "allkelsgotoheaven",
    config = {
        extra = {
            Xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'All Kels Go To Heaven',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult if played hand is {C:attention}High Card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}