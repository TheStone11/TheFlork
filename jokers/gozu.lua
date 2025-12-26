
SMODS.Joker{ --Gozu
    key = "gozu",
    config = {
        extra = {
            RoundsLeft = 3,
            hand_size0 = 2,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gozu',
        ['text'] = {
            [1] = 'Beat 3 rounds without playing your {C:attention}most played hand{} to obtain a',
            [2] = 'permanent {C:attention}+2{} hand size',
            [3] = '{C:red}self-destructs{} if played hand is your most played hand',
        [4] = '{C:inactive}Currently{} {C:attention}#1# {}{C:inactive}out of 3){}'
    },
    ['unlock'] = {
        [1] = 'Unlocked by default.'
    }
},
pos = {
    x = 2,
    y = 6
},
display_size = {
    w = 71 * 1, 
    h = 95 * 1
},
cost = 5,
rarity = 2,
blueprint_compat = false,
eternal_compat = false,
perishable_compat = true,
unlocked = true,
discovered = true,
atlas = 'CustomJokers2',
pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },

loc_vars = function(self, info_queue, card)
    
    return {vars = {card.ability.extra.RoundsLeft, card.ability.extra.var1}}
end,

calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
        if (function()
            local current_played = G.GAME.hands[context.scoring_name].played or 0
            for handname, values in pairs(G.GAME.hands) do
                if handname ~= context.scoring_name and values.played > current_played and values.visible then
                    return false
                end
            end
            return true
        end)() then
            local target_joker = card
            
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
            end
        end
    end
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        if to_big((card.ability.extra.RoundsLeft or 0)) > to_big(1) then
            return {
                func = function()
                    card.ability.extra.RoundsLeft = math.max(0, (card.ability.extra.RoundsLeft) - 1)
                    return true
                end
            }
        elseif to_big((card.ability.extra.var1 or 0)) <= to_big(1) then
            return {
                func = function()
                    local target_joker = card
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end,
                extra = {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(2)
                        return true
                    end,
                    colour = G.C.WHITE
                }
            }
        end
    end
end
}