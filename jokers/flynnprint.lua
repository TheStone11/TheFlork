
SMODS.Joker{ --Flynnprint
    key = "flynnprint",
    config = {
        extra = {
            hand_size_increase = '0',
            perishable = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Flynnprint',
        ['text'] = {
            [1] = 'Create a Negative Perishable Blueprint when Boss Blind is defeated'
            --[2] = '{C:red}-2{} {C:attention}Hand Size{}'
            --she's no longer the worst flynn joker in the mod :D
            
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
    cost = 20,
    rarity = "flynnset_flynnatic",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'flynnatics2',
    soul_pos = {
        x = 1,
        y = 1
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_blueprint' })
                            if joker_card then
                                joker_card:set_edition('e_negative', true)
                                joker_card:add_sticker('perishable', true)
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(0)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(0)
    end
}