SMODS.Joker{ --The Eye
    key = "theeye",
    config = {
        extra = {
            Mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Eye',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}X0.1{} Mult if played hand hasn\'t been played this round',
            [2] = 'resets otherwise',
            [3] = '(Currently {X:red,C:white}X#1# {})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Mult}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_flynnset_ratoncito" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        return {
                            func = function()
                                card.ability.extra.Mult = (card.ability.extra.Mult) + 0.1
                                return true
                                end
                            }
                        elseif G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                            return {
                                func = function()
                                    card.ability.extra.Mult = 1
                                    return true
                                    end
                                }
                            else
                                return {
                                    func = function()
                                        card.ability.extra.Mult = (card.ability.extra.Mult) + 0.1
                                        return true
                                        end
                                    }
                                end
                            end
                            if context.cardarea == G.jokers and context.joker_main  then
                                return {
                                    Xmult = card.ability.extra.Mult
                                }
                            end
                        end
}