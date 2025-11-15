SMODS.Joker{ --Grandpa
    key = "grandpa",
    config = {
        extra = {
            odds = 8,
            d_six = 0,
            start_dissolve = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Grandpa',
        ['text'] = {
            [1] = 'Creates a D6 Tag at the end of the round',
            [2] = '{C:green}#4# in #5#{} chance to self destruct when shop is rerolled'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_TAGS["tag_d_six"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"tag_d_six\" isn't a valid Tag key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flynnset_grandpa') 
        return {vars = {card.ability.extra.d_six, card.ability.extra.n, card.ability.extra.start_dissolve, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        return {
            func = function()
                G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_d_six")
                    if tag.name == "Orbital Tag" then
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible then
                                _poker_hands[#_poker_hands + 1] = k
                            end
                        end
                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                    end
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                    end
                }))
                return true
                end,
                message = "Created Tag!"
            }
        end
        if context.reroll_shop  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8dcf0d7c', 1, card.ability.extra.odds, 'j_flynnset_grandpa', false) then
                        SMODS.calculate_effect({func = function()
                            card:start_dissolve()
                            return true
                            end}, card)
                        end
                    end
                end
            end
}