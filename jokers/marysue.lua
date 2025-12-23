
SMODS.Joker{ --Mary Sue
    key = "marysue",
    config = {
        extra = {
            Mult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Mary Sue',
        ['text'] = {
            [1] = '{X:red,C:white}X#1# {} Mult, loses {X:red,C:white}X1{} Mult when a card is sold'
            --live laugh love mary sue
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
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
    atlas = 'CustomJokers2',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.Mult
            }
        end
        if context.selling_card  then
            if to_big((card.ability.extra.Mult or 0)) <= to_big(2) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            else
                return {
                    func = function()
                        card.ability.extra.Mult = math.max(0, (card.ability.extra.Mult) - 1)
                        return true
                    end,
                    message = "<//3"
                }
            end
        end
    end
}