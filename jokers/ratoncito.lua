SMODS.Joker{ --RATONCITO
    key = "ratoncito",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'RATONCITO',
        ['text'] = {
            [1] = 'EL ROEDOR!!!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
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
    pools = { ["flynnset_flynnset_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.ante_change  and not context.blueprint then
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_flynnset_theeye" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "2308f336").key
                        local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
                        voucher_card:start_materialize()
                        voucher_card.cost = 0
                        G.play:emplace(voucher_card)
                        delay(0.8)
                        voucher_card:redeem()
                        
                        G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                            voucher_card:start_dissolve()                
                            return true
                            end
                        }))
                        return {
                            message = nil
                        }
                    else
                        local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "45b42f84").key
                        local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
                        voucher_card:start_materialize()
                        voucher_card.cost = 0
                        G.play:emplace(voucher_card)
                        delay(0.8)
                        voucher_card:redeem()
                        
                        G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                            voucher_card:start_dissolve()                
                            return true
                            end
                        }))
                        return {
                            message = nil
                        }
                    end
                end
            end
}