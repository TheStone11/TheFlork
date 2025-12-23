
SMODS.Joker{ --Flynn
    key = "flynn",
    config = {
        extra = {

            emult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Flynn',
        ['text'] = {
            --EXPONENTIATION!!!!!!!! this is the ONLY joker that uses exponentiation, doing absolutely nothing if you don't have Talisman enabled
            [1] = '{X:red,C:white}^2{} Mult',
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

                e_mult = 2,
                message = "FLYNNTASTIC!"
            }
        end
        if context.selling_self  and not context.blueprint then
            error("die")
            --this is fully intentional the game crashes when you try to sell Flynn because doing so would make you a horrible monster that should be ashamed of their actions
        end
    end
}