
SMODS.Joker{ --Isolda
    key = "isolda",
    config = {
        extra = {
            cardsscored = 0,
            requirement = 6,
            ante_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Isolda',
        ['text'] = {
            [1] = '{C:red}-1{} Ante every #2# {C:diamonds}Diamonds{} scored, then',
            [2] = 'doubles requirement'
            --doesn't do anything else if Afonya is in your jokers, only he can restore uses.
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
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'thatoneatlaswiththefunnyfilename',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardsscored, card.ability.extra.requirement}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Diamonds") and to_big((card.ability.extra.cardsscored or 0)) < to_big(card.ability.extra.requirement)) then
                card.ability.extra.cardsscored = (card.ability.extra.cardsscored) + 1
            elseif (context.other_card:is_suit("Diamonds") and to_big((card.ability.extra.cardsscored or 0)) == to_big(card.ability.extra.requirement)) then
                card.ability.extra.cardsscored = 0
                card.ability.extra.requirement = (card.ability.extra.requirement) * 2
                local mod = -1
                ease_ante(mod)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                        return true
                    end,
                }))
                return {
                    message = "Ante -" .. 1
                }
            end
        end
    end
}