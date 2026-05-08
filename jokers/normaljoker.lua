
SMODS.Joker{ --Normal Joker
    key = "normaljoker",
    config = {
        extra = {
            eyesindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Normal Joker',
        ['text'] = {
            [1] = 'Earn {C:money}$2{} for every :eyes: card in deck at the end of the round',
            [2] = '{C:inactive}Currently #1#{}'
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
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'lookfuljokers',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'flynnset_eyes' then count = count + 1 end end; return count end)()) * 2}}
    end, 
    
    calc_dollar_bonus = function(card)
        local blind_reward = 0
    blind_reward = blind_reward + math.max(((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'flynnset_eyes' then count = count + 1 end end; return count end)()) * 2, 0)
        if blind_reward > 0 then
            return blind_reward
        end
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
        end
    end
}