
SMODS.Joker{ --Virtually Flynnsane
    key = "virtuallyflynnsane",
    config = {
        extra = {
            flynnset_jokers = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Virtually Flynnsane',
        ['text'] = {
            [1] = 'Creates a Flynnsanity Joker when hand is played',
            [2] = 'Does not require room, may overflow.'
            --Dancing, walking, rearranging furniture
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "flynnset_flynnatic",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 5
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'flynnset_flynnset_jokers' })
                    if joker_card then
                        joker_card:set_edition(card.ability.extra.e_negative, true)
                        
                    end
                    
                    return true
                end
            }))
            return {
                message = created_joker and localize('k_plus_joker') or nil
            }
        end
    end
}