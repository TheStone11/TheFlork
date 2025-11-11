SMODS.Joker{ --Merci
    key = "merci",
    config = {
        extra = {
            handsize = 4
        }
    },
    loc_txt = {
        ['name'] = 'Merci',
        ['text'] = {
            [1] = '{C:attention}+4{} hand size during first hand of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.handsize = 4
                    return true
                    end
                }
            end
            if context.after and context.cardarea == G.jokers  and not context.blueprint then
                return {
                    func = function()
                        card.ability.extra.handsize = 0
                        return true
                        end
                    }
                end
            end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.)
    end
}