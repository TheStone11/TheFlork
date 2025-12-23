
SMODS.Joker{ --cat
    key = "cat",
    config = {
        extra = {
            ante_value0 = -3,
            no = 0,
            var1 = 0,
            start_dissolve = 0,
            explode = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'cat', -- her name is "cat" in lowercase, get it right
        ['text'] = {
            [1] = 'If played hand contains more than one card, {C:red}tear apart the fabric of the universe{}'
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
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if to_big(#context.full_hand) > to_big(1) then
                local mod = -3 - G.GAME.round_resets.ante
                ease_ante(mod)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.round_resets.blind_ante = -3
                        return true
                    end,
                }))
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:explode({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                return {
                    message = "Ante set to " .. -3 .. "!"
                }
            end
        end
    end
}