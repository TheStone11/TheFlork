SMODS.Joker{ --Duality of Man
    key = "dualityofman",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Duality of Man',
        ['text'] = {
            [1] = 'Creates an EVIL playing card and a PLUEY playing card when blind is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                for i = 1, card.ability.extra.repetitions do
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local new_card = create_playing_card({
                    front = card_front,
                    center = 
                    G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
                new_card:set_seal("flynnset_pluey", true)
                
                G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                    end
                }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                front = card_front,
                center = 
                G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            new_card:set_seal("flynnset_evil", true)
            
            G.E_MANAGER:add_event(Event({
            func = function()
                new_card:start_materialize()
                G.play:emplace(new_card)
                return true
                end
            }))
                SMODS.calculate_effect({func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                        SMODS.calculate_effect({func = function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                                end
                            }))
                            draw_card(G.play, G.deck, 90, 'up')
                                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                        end
                    end
                end
            end
}