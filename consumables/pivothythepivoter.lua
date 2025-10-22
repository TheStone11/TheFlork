SMODS.Consumable {
    key = 'pivothythepivoter',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { extra = {
        money÷5 = 1,
        hand_type = "High Card",
        odds = 4
    } },
    loc_txt = {
        name = 'PIVOTHY THE PIVOTER',
        text = {
        [1] = 'Levels up High Card 1 time for every {C:money}$5{} you have,',
        [2] = '{C:green}#2# in 4{} chance to create an EVIL Joker'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_flynnset_pivothythepivoter')
        return {vars = {card.ability.extra.money÷5 + ((math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0)), numerator, denominator}}
    end,use = function(self, card, area, copier)
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
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(card.ability.extra.money÷5 + (math.floor(lenient_bignum(G.GAME.dollars / 5)))) })
            delay(1.3)
            level_up_hand(card, "High Card", true, card.ability.extra.money÷5 + (math.floor(lenient_bignum(G.GAME.dollars / 5))))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('High Card', 'poker_hands'), 
                 chips = G.GAME.hands['High Card'].chips, 
                 mult = G.GAME.hands['High Card'].mult, 
                 level=G.GAME.hands['High Card'].level})    
            delay(1.3)
            if SMODS.pseudorandom_probability(card, 'group_0_417c0f0c', 1, card.ability.extra.odds, 'c_flynnset_pivothythepivoter', false) then
                
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'flynnset_evil' })
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