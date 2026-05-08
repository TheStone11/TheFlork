
SMODS.Joker{ --Terezi Pyrope 
    key = "terezipyrope",
    config = {
        extra = {
            blind_size0 = 0.75,
            blind_size02 = 0.75,
            blind_size03 = 0.75
        }
    },
    loc_txt = {
        ['name'] = 'Terezi Pyrope ',
        ['text'] = {
            [1] = '{C:attention}3{}s, {C:attention}4{}s, and {C:attention}Aces{} give X0.75 blind size when scored'
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
    atlas = 'flynnatics2',
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(0.75).." Blind Size", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips * 0.75
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            elseif context.other_card:get_id() == 3 then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(0.75).." Blind Size", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips * 0.75
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            elseif context.other_card:get_id() == 4 then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(0.75).." Blind Size", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips * 0.75
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            end
        end
    end
}