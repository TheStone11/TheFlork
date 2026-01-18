--this joker is crossmod with the mod Cryptid, so you need to have it installed inorder for this joker to appear
SMODS.Joker{ --Dilecta Uxor
    key = "dilectauxor",
    -- means "Beloved Wife in Latin"
    config = {
        extra = {
            cardsindeck = 1
        }
    },
    loc_txt = {
        ['name'] = 'Dilecta Uxor',
        ['text'] = {
            [1] = 'Create an {C:enhanced}Enhanced{}, {C:dark_edition}Editioned{}, playing card when a card is scored',
            [2] = '{X:red,C:white}X0.2{} Mult for every card in your full deck',
            [3] = '{C:inactive}Currently {}{X:red,C:white}X#1#{} {C:inactive}Mult{}',
            [4] = '{C:inactive}Omnes Hapoten amant.{}' -- "Everyone loves Hapoten."
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 50,
    rarity = "cry_exotic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers2',
    dependencies = {"Cryptid"},
    soul_pos = {
        x = 7,
        y = 5
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardsindeck + ((#(G.deck and G.deck.cards or {}) or 0)) * 0.1}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local base_card = create_playing_card({
                front = card_front,
                center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
            }, G.discard, true, false, nil, true)
            
            
            base_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_cry_oversat','e_cry_m','e_cry_noisy'}, pseudoseed('add_card_hand_edition')), true)
            
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local new_card = copy_card(base_card, nil, nil, G.playing_card)
            
            new_card:add_to_deck()
            
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            G.deck:emplace(new_card)
            table.insert(G.playing_cards, new_card)
            
            base_card:remove()
            
            G.E_MANAGER:add_event(Event({
                func = function() 
                    new_card:start_materialize()
                    return true
                end
            }))
            return {
                message = "HAPOTEN IS YOUR FAVORITE CHARACTER."
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.cardsindeck + (#(G.deck and G.deck.cards or {})) * 0.2
            }
        end
    end
}


SMODS.Joker{ --Monaka
    key = "monaka",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Monaka',
        ['text'] = {
            [1] = 'Create a {C:green}Code{} card when a {C:attention}Lucky{} card successfully triggers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
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
    atlas = 'CustomJokers2',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.lucky_trigger then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        --trigger = 'after',
                        --delay = 0.4,
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards then
						        local c = create_card("Code", G.consumeables, nil, nil, nil, nil, nil)
						        c:add_to_deck()
						        G.consumeables:emplace(c)
						        card:juice_up()
					        end
					        return true
                        end
                    }))
                end
                delay(0.6)
                return {

                }
            end
        end
    end
}