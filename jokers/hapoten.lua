
SMODS.Joker{ --Hapoten
    key = "hapoten",
    config = {
        extra = {
            repetitions = 5
        }
    },
    loc_txt = {
        ['name'] = 'Hapoten',
        ['text'] = {
            [1] = '{C:red}Y{}{C:blue}o{}{C:green}u{}{C:purple}r{} {C:attention}f{}{C:money}a{}{C:gold}v{}{C:inactive}o{}{C:default}r{}{C:hearts}i{}{C:clubs}t{}{C:diamonds}e{} {C:spades}c{}{C:tarot}h{}{C:planet}a{}{C:spectral}r{}{C:enhanced}a{}{C:common}c{}{C:uncommon}t{}{C:rare}e{}{C:legendary}r{}', --why is every letter a different color? because i can -Flynn
            [2] = '',
            [3] = '{C:inactive}(Does something if first hand of round contains only one card){}'
            -- i know her ability is OP as hell but she's my favorite character in all of gimmiko so leave me alone 
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1.1, 
        h = 95 * 1.1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true, ["flynnset_gimmiko"] = true},

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (G.GAME.current_round.hands_played == 0 and to_big(#context.scoring_hand) == to_big(1)) then
                for i = 1, card.ability.extra.repetitions do
                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                    local base_card = create_playing_card({
                        front = card_front,
                        center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                    }, G.discard, true, false, nil, true)
                    
                    
                    base_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, pseudoseed('add_card_hand_edition')), true)
                    
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                end
            end
        end
    end
}