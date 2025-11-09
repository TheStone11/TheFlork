SMODS.Consumable {
    key = 'pivothythepivoter',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { extra = {
        money÷10 = 1,
        hand_type = "High Card"
    } },
    loc_txt = {
        name = 'PIVOTHY THE PIVOTER',
        text = {
        [1] = 'Levels up High Card 1 time for every {C:money}$10{} you have.',
        [2] = ''
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('High Card', 'poker_hands'), 
                  chips = G.GAME.hands['High Card'].chips, 
                  mult = G.GAME.hands['High Card'].mult, 
                  level = G.GAME.hands['High Card'].level })
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
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(card.ability.extra.money÷10 + (math.floor(lenient_bignum(G.GAME.dollars / 10)))) })
            delay(1.3)
            level_up_hand(card, "High Card", true, card.ability.extra.money÷10 + (math.floor(lenient_bignum(G.GAME.dollars / 10))))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('High Card', 'poker_hands'), 
                 chips = G.GAME.hands['High Card'].chips, 
                 mult = G.GAME.hands['High Card'].mult, 
                 level=G.GAME.hands['High Card'].level})    
            delay(1.3)
    end,
    can_use = function(self, card)
        return true
    end
}