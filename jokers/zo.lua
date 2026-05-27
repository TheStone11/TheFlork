
SMODS.Joker{ --Zo
    key = "zo",
    config = {
        extra = {
            hand_size_increase = '2',
            xmult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Zo',
        ['text'] = {
            [1] = '{C:red}-2{} Hand Size, {X:mult,C:white}X4{} Mult'
            --hey torn, wasn't this the lesbian demon from Gimmiko that you were in love with like 9 months ago? HAHAHAHA -Flynn
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
    pronouns = "she_her", 
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
                Xmult = 4
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