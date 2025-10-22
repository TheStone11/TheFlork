SMODS.Joker{ --Jokiff Jokaff
    key = "jokiffjokaff",
    config = {
        extra = {
            flynnset_jokers = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jokiff Jokaff',
        ['text'] = {
            [1] = '{C:attention}Create{} a Flynnsanity joker when blind is selected',
            [2] = '{C:inactive}(Must have room){}'
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
    pools = { ["flynnset_flynnset_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'flynnset_flynnset_jokers' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                    end
                }
            end
        end
}