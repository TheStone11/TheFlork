
SMODS.Joker{ --Jackson
    key = "jackson",
    config = {
        extra = {
            chips0 = 25
        }
    },
    loc_txt = {
        ['name'] = 'Jackson',
        ['text'] = {
            [1] = 'Jacks held in hand give {C:blue}+25{} Chips each',
            [2] = '{C:inactive}The son of Baron and Shoot the Moon!!!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 11 then
                return {
                    chips = 25
                }
            end
        end
    end
}