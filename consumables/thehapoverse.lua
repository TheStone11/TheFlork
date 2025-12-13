
SMODS.Consumable {
    key = 'thehapoverse',
    set = 'Planet',
    pos = { x = 7, y = 0 },
    config = { 
        extra = {
            odds = 4,
            repetitions = 1   
        } 
    },
    loc_txt = {
        name = 'The Hapoverse',
        text = {
            [1] = 'Levels ups a random hand 3 times, creates an EVIL Joker',
            [2] = '{C:inactive}Welcome to the hapoverse, young hapoling{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("flynnset_evil")
                
                return true
            end,
        }))
        if SMODS.pseudorandom_probability(card, 'group_0_b02fb121', 4, card.ability.extra.odds, 'j_flynnset_thehapoverse', true) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'flynnset_evil' })
                    if new_joker then
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "fuh u", colour = G.C.SECONDARY_SET.Tarot})
        end
    end,
    can_use = function(self, card)
        return true
    end
}