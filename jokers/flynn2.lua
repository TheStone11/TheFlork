SMODS.Joker{ --Flynn?
    key = "flynn2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Flynn?',
        ['text'] = {
            [1] = '???'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "flynnset_flynnsane",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 2
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            return {
                func = function()
                    
                    suit_prefix = 'S'
                    rank_suffix = 'A'
                    local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                    local new_card = create_playing_card({
                    front = card_front,
                    center = 
                    G.P_CENTERS.m_lucky
                }, G.discard, true, false, nil, true)
                new_card:set_seal("flynnset_pluey", true)
                new_card:set_edition("e_negative", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:emplace(new_card)
                    new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                        end
                    }))
                end,
                message = "Added Card to Hand!"
            }
        end
    end
}