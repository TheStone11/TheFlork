
SMODS.Joker{ --Restorer
    key = "restorer",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Restorer',
        ['text'] = {
            [1] = 'All {C:attention}face cards{} become 2s when scored',
            [2] = '{C:attention}2s{} held in hand create a random {C:attention}Tag{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
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
    atlas = 'thatoneatlaswiththefunnyfilename',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_imscared"] = true, ["flynnset_female"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "2"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 2 then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                                local tag = Tag(selected_tag)
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
    end
}