
SMODS.Joker{ --The Hook
    key = "thehook",
    config = {
        extra = {
            Chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Hook',
        ['text'] = {
            [1] = 'When a card is {C:attention}discarded{}, this joker gains {C:blue}+5{} Chips,',
            [2] = '{C:red}Resets at the end of the round{}',
            [3] = '(Currently {C:blue}+#1# {}Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
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
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Chips}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            return {
                func = function()
                    card.ability.extra.Chips = (card.ability.extra.Chips) + 5
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.Chips = 1
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Chips
            }
        end
    end
}