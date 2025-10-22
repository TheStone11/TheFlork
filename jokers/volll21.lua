SMODS.Joker{ --21 Voll
    key = "volll21",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = '21 Voll',
        ['text'] = {
            [1] = '{C:red}INSTANTLY DIE{} if played hand contains a scoring Ace or a 2',
            [2] = '{C:inactive}Alas, my poor Vollington, no one will mourn you.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "flynnset_evil",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('perishable', true)
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 2 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 1
                end)() then
                    return {
                        func = function()
                            
                            G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                if G.STAGE == G.STAGES.RUN then 
                                    G.STATE = G.STATES.GAME_OVER
                                    G.STATE_COMPLETE = false
                                end
                            end
                        }))
                        
                        return true
                        end
                    }
                elseif (function()
                    local rankCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:get_id() == 14 then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount >= 1
                    end)() then
                        return {
                            func = function()
                                
                                G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.5,
                                func = function()
                                    if G.STAGE == G.STAGES.RUN then 
                                        G.STATE = G.STATES.GAME_OVER
                                        G.STATE_COMPLETE = false
                                    end
                                end
                            }))
                            
                            return true
                            end
                        }
                    end
                end
            end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}