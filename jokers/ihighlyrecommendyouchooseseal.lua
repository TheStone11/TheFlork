
SMODS.Joker{ --I highly recommend you choose Seal
    key = "ihighlyrecommendyouchooseseal",
    config = {
        extra = {
            hand = 0
        }
    },
    loc_txt = {
        ['name'] = 'I highly recommend you choose Seal',
        ['text'] = {
            [1] = 'Create 3 cards with Seals if first hand of round contains a {C:attention}Three of a Kind{}'
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
        if context.cardarea == G.jokers and context.joker_main  then
            if (next(context.poker_hands["Three of a Kind"]) and G.GAME.current_round.hands_played == 0) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','flynnset_evil','flynnset_pluey','flynnset_charredseal'}, pseudoseed('add_card_hand_seal')), true)
                
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                base_card.playing_card = G.playing_card
                table.insert(G.playing_cards, base_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.hand:emplace(base_card)
                        base_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Added Card to Hand!"
                }
            end
        end
    end
}