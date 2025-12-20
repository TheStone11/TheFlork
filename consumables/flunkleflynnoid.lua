
SMODS.Consumable {
    key = 'flunkleflynnoid',
    set = 'what_are_these',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'FLUNKLE FLYNNOID',
        text = {
            [1] = 'Creates a Flynnatic Joker, creates 2 evil jonklers',
            [2] = 'yo what are they adding into Flynnsanity atp ts pmo'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    soul_pos = {
        x = 3,
        y = 0
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'flynnset_flynnatic' })
                if new_joker then
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("flynnset_evil")
                
                return true
            end,
        }))
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
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("flynnset_evil")
                
                return true
            end,
        }))
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
    end,
    can_use = function(self, card)
        return true
    end
}