
SMODS.Joker{ --The Plant
    key = "theplant",
    config = {
        extra = {
            MultStored = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Plant',
        ['text'] = {
            [1] = 'This joker gains {X:mult,C:white}X0.05{} Mult when a non-face card is scored,',
            [2] = 'resets when boss blind is defeated or when a face card is scored',
            [3] = '(Currently {X:mult,C:white}X#1# {})',
            [4] = '{C:inactive}Thirst trap to get you to hate on face cards, it\'s working...{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MultStored}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.MultStored
            }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_face() then
                card.ability.extra.MultStored = 1
                return {
                    message = "Reset!"
                }
            else
                card.ability.extra.MultStored = (card.ability.extra.MultStored) + 0.05
                return {
                    message = "Upgrade!"
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.MultStored = 1
                    return true
                end,
                message = "Reset!"
            }
        end
    end
}