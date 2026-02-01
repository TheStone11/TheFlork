
SMODS.Joker{ --Soggy Cat
    key = "soggycat",
    config = {
        extra = {
            wearecharliekirk = 0,
            basediscardsperround = 1,
            discards0 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Soggy Cat',
        ['text'] = {
            [1] = 'When blind is selected, lose all discards and gain {X:red,C:white}X0.5{} Mult for every discard lost, resets',
            [2] = 'at the end of the round{C:inactive} (Currently, {X:red,C:white}X#1#{} Mult){}'
            --funny cat.
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1,
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
    atlas = 'thatoneatlaswiththefunnyfilename',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.wearecharliekirk, card.ability.extra.basediscardsperround + ((G.GAME.round_resets.discards or 0)) * 0.5}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    card.ability.extra.wearecharliekirk = (card.ability.extra.wearecharliekirk) + card.ability.extra.basediscardsperround + (G.GAME.round_resets.discards) * 0.5
                    return true
                end,
                extra = {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(0).." Discards", colour = G.C.BLUE})
                        G.GAME.current_round.discards_left = 0
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.wearecharliekirk = 1
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.wearecharliekirk
            }
        end
    end
}