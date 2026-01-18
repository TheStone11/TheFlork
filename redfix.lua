
SMODS.Joker{ --Redfix
    key = "redfix",
    config = {
        extra = {
            Mult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Redfix',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult',
            [2] = 'Doubles Mult when a Booster Pack is skipped'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
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
        
        return {vars = {card.ability.extra.Mult}}
    end,
    
    calculate = function(self, card, context)
        if context.skipping_booster  then
            return {
                func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) * 2
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.Mult
            }
        end
    end
}