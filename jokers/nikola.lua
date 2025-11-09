SMODS.Joker{ --Nikola
    key = "nikola",
    config = {
        extra = {
            blind_size = 2,
            ethereal = 0
        }
    },
    loc_txt = {
        ['name'] = 'Nikola',
        ['text'] = {
            [1] = 'X2 Score Requirement, create an Ethereal Tag at the end of the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                    G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                        end
                    }
                end
            if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_ethereal")
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
            end
}