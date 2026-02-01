
SMODS.Joker{ --Afonya
    key = "afonya",
    config = {
        extra = {
            uses = 3,
            ante_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Afonya',
        ['text'] = {
            [1] = 'When boss blind is defeated, {C:red}-1{} Ante if this is the {C:attention}leftmost{} Joker',
            [2] = 'has {C:attention}#1#{} uses',
            [3] = '{C:inactive}(Has an unique interaction if you find a certain girl.){}'
            --This joker is based on That Level Again, hence the ante decrease, if you have Isolda, Afonya slowly gains uses back, this is a reference to how Afonya loves Isolda as shown in TLA 3, although he's nowhere to be seen in TLA 4
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    discovered = true,
    atlas = 'thatoneatlaswiththefunnyfilename',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.uses}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if (to_big((card.ability.extra.uses or 0)) >= to_big(1) and (function()
                return G.jokers.cards[1] == card
            end)()) then
                return {
                    
                    func = function()
                        
                        local mod = -1
                        ease_ante(mod)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                                return true
                            end,
                        }))
                        return true
                    end,
                    message = "Ante -" .. 1,
                    extra = {
                        func = function()
                            card.ability.extra.uses = math.max(0, (card.ability.extra.uses) - 1)
                            return true
                        end,
                        colour = G.C.RED
                    }
                }
            elseif (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_flynnset_isolda" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        card.ability.extra.uses = (card.ability.extra.uses) + 0.5
                        return true
                    end
                }
            end
        end
    end
}