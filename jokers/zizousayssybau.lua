
SMODS.Joker{ --Zizou Says Sybau
    key = "zizousayssybau",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Zizou',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance to make a {C:dark_edition}Negative{} {C:attention}Gimmiko{} Joker when a card is sold'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'flynnatics1',
    soul_pos = {
        x = 1,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flynnset_zizousayssybau') 
        return {vars = {card.ability.extra.Handsize, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_e12043b3', 1, card.ability.extra.odds, 'j_flynnset_zizousayssybau', false) then
                    SMODS.calculate_effect({func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'flynnset_gimmiko' })
                                if joker_card then
                                    joker_card:set_edition("e_negative", true)
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}