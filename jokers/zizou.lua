SMODS.Joker{ --Zizou
    key = "zizou",
    config = {
        extra = {
            PackSkipped = 10,
            alljokerssellvalue = 0,
            respect = 0,
            explode = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Zizou',
        ['text'] = {
            [1] = 'If #1# Booster Packs are skipped, this joker creates Zizou Says Sybau',
            [2] = 'Adds 10 times all other joker\'s sell price to score requirement'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1.5, 
        h = 95 * 1.5
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.PackSkipped}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()) * 10).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips + ((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()) * 10
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                        end
                    }
                end
                if context.skipping_booster  and not context.blueprint then
                    if (card.ability.extra.PackSkipped or 0) <= 1 then
                        return {
                            func = function()
                                
                                local created_joker = true
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flynnset_zizousayssybau' })
                                    if joker_card then
                                        joker_card:set_edition("e_negative", true)
                                        
                                    end
                                    
                                    return true
                                    end
                                }))
                                
                                if created_joker then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                end
                                return true
                                end,
                                extra = {
                                func = function()
                                    card:explode()
                                    return true
                                    end,
                                    colour = G.C.RED
                                }
                            }
                        else
                            return {
                                func = function()
                                    card.ability.extra.PackSkipped = math.max(0, (card.ability.extra.PackSkipped) - 1)
                                    return true
                                    end
                                }
                            end
                        end
                    end
}