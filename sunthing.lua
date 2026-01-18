
SMODS.Joker{ --Sunthing
    key = "sunthing",
    config = {
        extra = {
            SunthingMoney = 1,
            money÷5 = 0,
            dollars0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Sunthing',
        ['text'] = {
            [1] = 'Obtain {C:money}$1{} at the end of the round for every $5 you have',
            [2] = 'Earn {C:money}$10{} when you use {C:tarot}The Sun{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 2,
    },
    soul_pos = {
        x = 1,
        y = 2,
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
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
        
        local info_queue_0 = G.P_CENTERS["c_sun"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_sun\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.SunthingMoney, (math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0)}}
    end, 
    
    calc_dollar_bonus = function(card)
        local blind_reward = 0
        blind_reward = blind_reward + math.max(math.floor(lenient_bignum(G.GAME.dollars / 5)), 0)
        if blind_reward > 0 then
            return blind_reward
        end
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_sun' then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 10
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}