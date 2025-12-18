
SMODS.Consumable {
    key = 'jimbotron3000',
    set = 'what_are_these',
    pos = { x = 5, y = 0 },
    config = { 
        extra = {
            repetitions = 1   
        } 
    },
    loc_txt = {
        name = 'Jimbotron 3000',
        text = {
            [1] = 'create one jmibo for every empty joker slot, {C:money}+$5{} per jimbo created'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        for i = 1, card.ability.extra.repetitions do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}