SMODS.Joker{ --Eric
    key = "eric",
    config = {
        extra = {
            chips = -491,
            chips2 = -491,
            chips3 = -491
        }
    },
    loc_txt = {
        ['name'] = 'Eric',
        ['text'] = {
            [1] = '4s, 9s, and Aces give {X:blue,C:black}-491{} Chips when scored',
            [2] = '{C:inactive}Alas, my poor Eric, but your jokes didn\'t get you far.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "flynnset_evil",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('perishable', true)
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:get_id() == 4 then
                return {
                    chips = card.ability.extra.chips
                }
            elseif context.other_card:get_id() == 9 then
                return {
                    chips = card.ability.extra.chips2
                }
            elseif context.other_card:get_id() == 14 then
                return {
                    chips = card.ability.extra.chips3
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}