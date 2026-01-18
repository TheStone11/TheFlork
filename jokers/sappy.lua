
SMODS.Joker{ --Sappy
    key = "sappy",
    config = {
        extra = {
            discard_size_increase = '1'
        }
    },
    loc_txt = {
        ['name'] = 'Sappy',
        ['text'] = {
            [1] = 'You may {C:red}discard{} up to one more card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'sappy',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(-1)
    end
}