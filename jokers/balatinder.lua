<<<<<<< HEAD
--yo what the FUCK was i cooking when making this joker bruh:sob:
=======
<<<<<<< HEAD
--yo what the FUCK was i cooking when making this joker bruh:sob:
=======
<<<<<<< HEAD

=======
--yo what the FUCK was i cooking when making this joker bruh:sob:
>>>>>>> 34f1575 (JESSE, DON'T OPEN MERCI.LUA, JESSE!!!)
>>>>>>> 1d9e02498e9b9e2a1fe0575e73a6890f74001664
>>>>>>> f1d41370b37891c85d99e193966811d8dd8f89dd
SMODS.Joker{ --Balatinder
    key = "balatinder",
    config = {
        extra = {
            female = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Balatinder',
        ['text'] = {
            [1] = 'Create a {X:tarot,C:white}Female{} {C:attention}joker{} when Boss Blind is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'flynnset_female' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end
                }
            end
        end
    end
}