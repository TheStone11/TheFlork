SMODS.Joker{ --Unfunny Overused Joke
    key = "unfunnyoverusedjoke",
    config = {
        extra = {
            dollars = 25
        }
    },
    loc_txt = {
        ['name'] = 'Unfunny Overused Joke',
        ['text'] = {
            [1] = 'if hand contains Spades, lose {C:red}-$25{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
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
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (function()
                local suitCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:is_suit("Spades") then
                        suitCount = suitCount + 1
                    end
                end
                
                return suitCount >= 1
                end)() then
                    return {
                        func = function()

                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars - 25
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(25), colour = G.C.MONEY})
                        return true
                        end
                    }
                end
            end
        end
}