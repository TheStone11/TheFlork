
SMODS.Joker{ --Jimbo Jr.
    key = "jimbojr",
    config = {
        extra = {
            hand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jimbo Jr.',
        ['text'] = {
            [1] = 'Creates a 2 when blind is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
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
                    
                    local suit_prefix = pseudorandom_element({'H','S','D','C'}, "random_suit")
                    local rank_suffix = '2'
                    local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                    local base_card = create_playing_card({
                        front = card_front,
                        center = G.P_CENTERS.c_base
                    }, G.discard, true, false, nil, true)
                    
                    
                    
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    base_card.playing_card = G.playing_card
                    table.insert(G.playing_cards, base_card)
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:emplace(base_card)
                            base_card:start_materialize()
                            SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                            return true
                        end
                    }))
                end,
                message = "ooo!"
            }
        end
    end
}