SMODS.Joker{ 
    key = "feferipreg",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Feferipreg',
        ['text'] = {
            [1] = 'Creates a Joker if hand contains a Pair of Queens',
            [2] = '{C:inactive}(Must have room){}'
            
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
    rarity = 2,
    pronouns = "she_her", 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'lookatme',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == Q then
                        count = count + 1
                    end
                end
                return count >= 2
            end)() then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_joker and localize('k_plus_joker') or nil
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        love.system.openURL("https://mspfa.com/?s=55441&p=1")
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        love.system.openURL("https://mspfa.com/?s=55441&p=1")
    end
}