
SMODS.Joker{ --Flynn
    key = "flynn",
    config = {
        extra = {

            queensindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Flynn',
        ['text'] = {
            [1] = '{C:attention}+1{} hand size for every {C:attention}Queen{} in full deck',
            [2] = '{C:inactive}(Currently #1#){}',
            [3] = 'oh hey, i am Flynn',
            [4] = 'I made the mod, I love myselF some selF-indulgence',
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
    cost = 5,
    rarity = "flynnset_flynnatic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'flynnatics1',
    soul_pos = {
        x = 1,
        y = 1
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    loc_vars = function(self, info_queue, card)
        
    return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 12 then count = count + 1 end end; return count end)()}}
    end,
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
    G.hand:change_size((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 12 then count = count + 1 end end; return count end)())
    end,
    
    remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 12 then count = count + 1 end end; return count end)())
    end
}