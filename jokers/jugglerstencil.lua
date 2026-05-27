
SMODS.Joker{
    key = "jugglerstencil",
    config = {
        extra = {
            freejokerslots = 0
        }
    },
    loc_txt = {
        ['name'] = 'Juggler Stencil',
        ['text'] = {
            [1] = '{C:attention}+1{} hand size for every empty joker slot',
            [2] = '{C:inactive}(other stencils included){}'
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
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'lookatme',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and (G.jokers and G.jokers.cards or {}) or {}))}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {})))
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {})))
    end
}