SMODS.Joker{ --Five Hundred Standard Tags
    key = "aromanticflagnikola",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Five Hundred Standard Tags',
        ['text'] = {
            [1] = '???'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "flynnset_evil",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('perishable', true)
        card:set_edition("e_negative", true)
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                for i = 1, pseudorandom('repetitions_09449e69', 1, 2) do
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        local tag = Tag("tag_standard")
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created Tag!", colour = G.C.GREEN})
                end
            end
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_flynnset_aromanticflagnikola" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_flynnset_aromanticflagnikola" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end