SMODS.Joker{ --Sheriff
    key = "sheriff",
    config = {
        extra = {
            repetitions = 3
        }
    },
    loc_txt = {
        ['name'] = 'Sheriff',
        ['text'] = {
            [1] = 'JUSTICE WILL BE SERVED!'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "flynnset_flynnsane",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 8,
        y = 2
    },

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if G.GAME.blind.boss then
                for i = 1, card.ability.extra.repetitions do
                        SMODS.calculate_effect({func = function()
                            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "JUSTICE!", colour = G.C.GREEN})
                            end
                            return true
                            end}, card)
                        end
                    end
                end
            end
}