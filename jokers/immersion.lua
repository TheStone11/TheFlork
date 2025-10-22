SMODS.Joker{ --Immersion
    key = "immersion",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Immersion',
        ['text'] = {
            [1] = 'Flips and shuffles Jokers when blind is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "flynnset_evil",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('perishable', true)
        card:set_edition("e_negative", true)
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if #G.jokers.cards > 0 then
                for _, joker in ipairs(G.jokers.cards) do
                    joker:flip()
                end
            end
            if #G.jokers.cards > 1 then
                G.jokers:unhighlight_all()
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 0.85)
                        return true
                        end,
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1.15)
                        return true
                        end
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1)
                        return true
                        end
                    }))
                    delay(0.5)
                    return true
                    end
                }))
            end
            return {
                message = "Flip!",
                extra = {
                message = "Shuffle!",
                colour = G.C.ORANGE
            }
        }
    end
end
}