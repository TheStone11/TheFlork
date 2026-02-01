
SMODS.Joker{ --HER
    key = "her",
    config = {
        extra = {
            --dpn't judge me for this variable name :P
            MANHAPOTENISSOFUCKINGHOT = 6
        }
    },
    loc_txt = {
        ['name'] = 'HER',
        ['text'] = {
            [1] = 'Creates a {C:attention}Tag{} every {C:attention}6 face{} cards scored',
            [2] = '{C:inactive}(#1#/6 cards left){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
    atlas = 'thatoneatlaswiththefunnyfilename',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_imscared"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MANHAPOTENISSOFUCKINGHOT}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                card.ability.extra.MANHAPOTENISSOFUCKINGHOT = math.max(0, (card.ability.extra.MANHAPOTENISSOFUCKINGHOT) - 1)
            elseif (context.other_card:is_face() and to_big((card.ability.extra.MANHAPOTENISSOFUCKINGHOT or 0)) <= to_big(0)) then
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
                card.ability.extra.MANHAPOTENISSOFUCKINGHOT = 6
                return {
                    message = "Created Tag!"
                }
            end
        end
    end
}