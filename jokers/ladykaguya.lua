
SMODS.Joker{ --Lady Kaguya
    key = "ladykaguya",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Lady Kaguya',
        ['text'] = {
            [1] = '{C:attention}Gimmiko{} Jokers each give {X:red,C:white}X1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
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
    atlas = 'CustomJokers2',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true, ["flynnset_female"] = true },
    
    calculate = function(self, card, context)
        if context.other_joker then
            if context.other_joker.config.center.pools and (context.other_joker.config.center.pools.flynnset_gimmiko) then
                    return {
                        xmult = 1.5
                }
            end
        end
    end
}