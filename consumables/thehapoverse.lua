SMODS.Consumable {
    key = 'thehapoverse',
    set = 'Planet',
    pos = { x = 7, y = 0 },
    config = { extra = {
        odds = 4,
        repetitions = 1,
        levels = 5
    } },
    loc_txt = {
        name = 'The Hapoverse',
        text = {
        [1] = 'Levels ups all hands alot of times, creates an EVIL Joker',
        [2] = '{C:inactive}Welcome to the hapoverse, young hapoling{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
     func = function()
    play_sound("flynnset_evil")
    
    return true
    end,
}))
            if SMODS.pseudorandom_probability(card, 'group_0_b02fb121', 4, card.ability.extra.odds, 'c_flynnset_thehapoverse', true) then
                
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
            end
            for i = 1, card.ability.extra.repetitions do
              
                update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(5) })
            delay(1.3)
            for poker_hand_key, _ in pairs(G.GAME.hands) do
                level_up_hand(card, poker_hand_key, true, 5)
            end
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                { mult = 0, chips = 0, handname = '', level = '' })
          end
    end,
    can_use = function(self, card)
        return true
    end
}