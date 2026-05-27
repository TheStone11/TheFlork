SMODS.Joker{ 
    key = "domer",
    config = {
        extra = {
            xmult0 = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Domer',
        ['text'] = {
            [1] = 'If played hand contains {C:attention}4{} cards, last card gives {X:red,C:white}X2.5{} Mult and is destroyed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
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
    atlas = 'lookatme',
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (to_big(#context.full_hand) == to_big(4) and context.other_card == context.scoring_hand[#context.scoring_hand]) then
                context.other_card.should_destroy = true
                return {
                    Xmult = 2.5,
                    extra = {
                        message = "!!!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}