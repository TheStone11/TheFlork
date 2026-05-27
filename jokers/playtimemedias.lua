
SMODS.Joker{ --Playtime Medias
    key = "playtimemedias",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Playtime Medias',
        ['text'] = {
            [1] = 'Discarded cards get their rank {C:attention}randomized{}',
            [2] = '{C:inactive} You\'re getting a whole ass balatro joker.{}'
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
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'lookatme',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.discard  then
            return {
                func = function()
                    assert(SMODS.change_base(context.other_card, nil, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                end,
                message = "You find Baldi Medias, it's PLAYTIME Medias"
            }
        end
    end
}