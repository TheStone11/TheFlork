
SMODS.Joker{ --Merci
    key = "merci",
    config = {
        extra = {
            handsize = 4,
            money÷10 = 0,
            discards0 = 1,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Merci',
        ['text'] = {
            [1] = '{C:attention}+1{} Hand Size for every {C:gold}$10{} you have',
            [2] = '{C:red}-1{} Discard (currently {C:attention}+#2#{} Hand Size)'
            --MERCI IS A FAGGOT
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
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.handsize, (math.floor(lenient_bignum(G.GAME.dollars / 10)) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Discards", colour = G.C.RED})
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - 1
                    return true
                end
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(math.floor(lenient_bignum(G.GAME.dollars / 10)))
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-math.floor(lenient_bignum(G.GAME.dollars / 10)))
    end
}