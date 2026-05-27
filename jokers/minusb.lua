--ts slopping me

SMODS.Joker{ 
    key = "minusb",
    config = {
        extra = {
            blind_size0_min = 0,5,
            blind_size0_max = 1.5,
            dollars0_min = 0,
            dollars0_max = 2,
            odds = 0,5,
            odds2 = 0,5,
            pb_x_chips_098e976d = 3
        },
    },
    loc_txt = {
        ['name'] = '-b',
        ['text'] = {
            [1] = '{C:edition}',
            [2] = '',
            [3] = '',
            [4] = '{s:10}-b{}',
            [5] = '',
            [6] = '',
            [7] = '{}'
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
    cost = -99999999999999999,
    rarity = "flynnset_minusb",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'minusb',
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
            or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_minusb') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
     set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-b", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * pseudorandom('RANGE:0.5|1.5', 0.5, 1.5)
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end,
                extra = {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars * pseudorandom('RANGE:0.25|4', 0.25, 4)
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(pseudorandom('RANGE:0.25|4', 0.25, 4)), colour = G.C.MONEY})
                        return true
                    end,
                    colour = G.C.MONEY
                }
            }
        end
        if context.individual and context.cardarea == G.play  then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                    local enhancement_pool = {}
                    for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                        if enhancement.key ~= 'm_stone' then
                            enhancement_pool[#enhancement_pool + 1] = enhancement
                        end
                    end
                    local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                    scored_card:set_ability(random_enhancement)
                    local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                    if random_seal then
                        scored_card:set_seal(random_seal, true)
                    end
                    local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                    if random_edition then
                        scored_card:set_edition(random_edition, true)
                    end
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "-b", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
        if context.discard  then
            return {
                func = function()
                    assert(SMODS.change_base(context.other_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                    local enhancement_pool = {}
                    for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                        if enhancement.key ~= 'm_stone' then
                            enhancement_pool[#enhancement_pool + 1] = enhancement
                        end
                    end
                    local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                    context.other_card:set_ability(random_enhancement)
                    local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                    if random_seal then
                        context.other_card:set_seal(random_seal, true)
                    end
                    local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                    if random_edition then
                        context.other_card:set_edition(random_edition, true)
                    end
                end,
                message = "-b"
            }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            return {
                func = function()
                    assert(SMODS.change_base(context.other_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, pseudorandom_element(SMODS.Ranks, 'edit_card_rank').key))
                    local enhancement_pool = {}
                    for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                        if enhancement.key ~= 'm_stone' then
                            enhancement_pool[#enhancement_pool + 1] = enhancement
                        end
                    end
                    local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                    context.other_card:set_ability(random_enhancement)
                    local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                    if random_seal then
                        context.other_card:set_seal(random_seal, true)
                    end
                    local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                    if random_edition then
                        context.other_card:set_edition(random_edition, true)
                    end
                end,
                message = "-b"
            }
        end
    end
}