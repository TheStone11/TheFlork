--Hello everybody my name is Markiplier
SMODS.Joker{ --Markiplier in Hospital Gif
    key = "markiplierinhospitalgif",
    config = {
        extra = {
            levels0 = 14,
            explode = 0,
            y = 0,
            no = 0
        }
    },
    loc_txt = {
        ['name'] = 'Markiplier in Hospital Gif',
        ['text'] = {
            [1] = 'Levels up played hand 14 times, {C:red}Self-Destructs{}'
            --Was that the joke of '87? 
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            local target_hand = (context.scoring_name or "High Card")
            level_up_hand(card, target_hand, true, 14)
            return {
                message = localize('k_level_up_ex'),
                extra = {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Usually the first ante is not that bad- WHAT???", colour = G.C.RED})
                        end
                        return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}