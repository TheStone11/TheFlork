
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
        x = 0,
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
=======
>>>>>>> 1d9e02498e9b9e2a1fe0575e73a6890f74001664
>>>>>>> f1d41370b37891c85d99e193966811d8dd8f89dd

>>>>>>> 34f1575 (JESSE, DON'T OPEN MERCI.LUA, JESSE!!!)
    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('perishable', true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if context.scoring_hand:get_id() == 2 then
                        count = count + 1
                    end
                end
                return count >= 1
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
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if context.scoring_hand:get_id() == A then
                        count = count + 1
                    end
                end
                return count >= 1
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