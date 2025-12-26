
SMODS.Joker{ --Jack the Ripper
    key = "jacktheripper",
    config = {
        extra = {
            mod_probability0 = 4,
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jack the Ripper',
        ['text'] = {
            [1] = 'ALL listed probabilites are {C:green}quadrupled{}',
            [2] = '{C:red}-1{} hand every round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
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
    atlas = 'CustomJokers2',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },
    
    calculate = function(self, card, context)
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * (4)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hands", colour = G.C.RED})
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - 1
                    return true
                end
            }
        end
    end
}