SMODS.Joker{ --Sprue
    key = "sprue",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Sprue',
        ['text'] = {
            [1] = '{C:attention}+1{} Voucher Slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true, ["flynnset_female"] = true },

    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
    end
}