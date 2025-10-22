SMODS.Joker{ --Markiplier in Hospital Gif
    key = "markiplierinhospitalgif",
    config = {
        extra = {
            levels = 14,
            explode = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Markiplier in Hospital Gif',
        ['text'] = {
            [1] = 'Levels up played hand 14 times, {C:red}Self-Destructs{}'
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
            return {
                level_up = card.ability.extra.levels,
                level_up_hand = target_hand,
                message = localize('k_level_up_ex'),
                extra = {
                func = function()
                    card:explode()
                    return true
                    end,
                    message = "Usually the first ante is not that bad- WHAT???",
                    colour = G.C.RED
                }
            }
        end
    end
}