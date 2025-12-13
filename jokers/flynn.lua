
SMODS.Joker{ --Flynn
    key = "flynn",
    config = {
        extra = {
            emult0 = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'Flynn',
        ['text'] = {
            [1] = '{X:red,C:white}^1.3{} Mult',
            [2] = '',
            [3] = 'hey, i am flynn',
            [4] = '',
            [5] = 'do not sell me cro'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "flynnset_flynnatic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = 1.3,
                message = "FLYNNTASTIC!"
            }
        end
        if context.selling_self  and not context.blueprint then
            error("die")
        end
    end
}