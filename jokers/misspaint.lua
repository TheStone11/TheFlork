
SMODS.Joker{ --Miss Paint
    key = "misspaint",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Miss Paint',
        ['text'] = {
            [1] = 'Cards held in hand have a {C:green}#1# in #2#{} chance to',
            [2] = 'gain a random {C:enhanced}Enhancement{} when hand is played'
            --She's not based on the character Miss Paint from Homestuck, but instead Miss Paint from the upcoming game of the same name.
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
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
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flynnset_misspaint') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_3c2dcde5', 1, card.ability.extra.odds, 'j_flynnset_misspaint', false) then
                    SMODS.calculate_effect({func = function()
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                enhancement_pool[#enhancement_pool + 1] = enhancement
                            end
                        end
                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                        context.other_card:set_ability(random_enhancement)
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                end
            end
        end
    end
}