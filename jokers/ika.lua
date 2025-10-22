SMODS.Joker{ --Ika
    key = "ika",
    config = {
        extra = {
            MultStored = 1
        }
    },
    loc_txt = {
        ['name'] = 'Ika',
        ['text'] = {
            [1] = '{C:attention}+2{} Booster Pack slots'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true, ["flynnset_female"] = true },

    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(2)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-2)
    end
}