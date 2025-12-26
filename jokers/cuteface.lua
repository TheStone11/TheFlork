
SMODS.Joker{ --:3
    key = "cuteface",
    config = {
        extra = {
            cutefacehealth = 0,
            alljokerssellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = ':3',
        ['text'] = {
            [1] = '{C:dark_edition}Greetings, Balatro player, i arrived here to announce that if your',
            [2] = 'played hand does NOT contain a 3, i\'ll add 35 times the sell price of your other jokers to the blind score requirement size',
            [3] = 'I will disappear once 5 hands are scored without triggering my effect (#1#/5)',
            [4] = ':3{}'
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
    cost = 5,
    rarity = "flynnset_evil",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.cutefacehealth, ((function() local total = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do total = total + joker.sell_cost end; return total end)()) * 35}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 3 then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()) * 35).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips + ((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()) * 35
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            elseif to_big((card.ability.extra.cutefacehealth or 0)) >= to_big(4) then
                G.E_MANAGER:add_event(Event({
                    blocking = false,
                    func = function()
                        if G.STATE == G.STATES.SELECTING_HAND then
                            G.GAME.chips = G.GAME.blind.chips
                            G.STATE = G.STATES.HAND_PLAYED
                            G.STATE_COMPLETE = true
                            end_round()
                            return true
                        end
                    end
                }))
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:shatter({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Broken!", colour = G.C.RED})
                end
                return {
                    message = "Win!"
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 3 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                card.ability.extra.cutefacehealth = (card.ability.extra.cutefacehealth) + 1
            end
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_flynnset_cuteface" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_flynnset_cuteface" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end