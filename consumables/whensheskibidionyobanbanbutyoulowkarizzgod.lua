SMODS.Consumable {
    key = 'whensheskibidionyobanbanbutyoulowkarizzgod',
    set = 'what_are_these',
    pos = { x = 0, y = 0 },
    config = { extra = {
        double_limit = 6700000000000,
        double_limit = 6700000000000
    } },
    loc_txt = {
        name = 'when she skibidi on yo banban but you lowk a rizz god',
        text = {
        [1] = 'Quadruples money, creates an EVIL joker'
    }
    },
    cost = 50,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    local double_amount = math.min(G.GAME.dollars, 6700000000000)
                    ease_dollars(double_amount, true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    local double_amount = math.min(G.GAME.dollars, 670000000)
                    ease_dollars(double_amount, true)
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