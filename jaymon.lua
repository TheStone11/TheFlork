
SMODS.Joker{ --Jaymon
    key = "jaymon",
    config = {
        extra = {
            Uses = 23,
            card_draw0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Jaymon',
        ['text'] = {
            [1] = 'Draw 2 extra cards when a {C:clubs}Clubs{} card is scored',
            [2] = '{C:inactive}(#1# uses left, resets at the end of the ante{}'
            },
            ['unlock'] = {
                [1] = 'Unlocked by default.'
            }
        },
        pos = {
            x = 0,
            y = 4
        },
        soul_pos = {
            x = 1,
            y = 4
        },
        display_size = {
            w = 71 * 1, 
            h = 95 * 1
        },
        cost = 20,
        rarity = 4,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        atlas = 'legendaries',
        in_pool = function(self, args)
            return (
                not args 
                or args.source ~= 'sho' 
                or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
            )
            and true
        end,
        
        loc_vars = function(self, info_queue, card)
            
            return {vars = {card.ability.extra.Uses}}
        end,
        
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play  then
                if (context.other_card:is_suit("Clubs") and to_big(card.ability.extra.Uses) > to_big(0)) then
                    if G.hand and #G.hand.cards > 0 then
                        card.ability.extra.Uses = math.max(0, (card.ability.extra.Uses) - 1)
                        SMODS.draw_cards(2)
                    end
                    return {
                        message = "!!!"
                    }
                end
            end
            if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    func = function()
                        card.ability.extra.Uses = 23
                        return true
                    end,
                    message = "Reset!"
                }
            end
        end
    }