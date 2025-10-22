SMODS.Joker{ --Zo
    key = "zo",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Zo',
        ['text'] = {
            [1] = '{C:red}-2{} Hand Size, {X:mult,C:white}X4{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
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
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true, ["flynnset_female"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-2)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(2)
    end
}