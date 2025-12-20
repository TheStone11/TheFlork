
SMODS.Joker{ --Mercury
    key = "mercury",
    config = {
        extra = {
            MercuryUsed = 0,
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mercury',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance to swap Chips and Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
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
    atlas = 'CustomJokers2',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flynnset_mercury') 
        return {vars = {card.ability.extra.MercuryUsed, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d0240609', 1, card.ability.extra.odds, 'j_flynnset_mercury', false) then
                    SMODS.calculate_effect({swap = true}, card)
                end
            end
        end
    end
}