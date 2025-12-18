
SMODS.Joker{ --Astro
    key = "astro",
    config = {
        extra = {
            chips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Astro',
        ['text'] = {
            [1] = 'This {C:blue}astro{} gains {X:chips,C:white}X0.1{} Chips when a {C:spades}Spades{} card is scored',
            [2] = 'resets when a {C:hearts}Hearts{} card is scored',
            [3] = 'Currently {X:chips,C:white}X#1# {} Chips',
            [4] = '{s:2}meow mrow...{}',
            [5] = '',
            [6] = '{s:4}:3{}'
            -- they be letting anybody in flynnsanity these days
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                card.ability.extra.chips = (card.ability.extra.chips) + 0.1
            elseif context.other_card:is_suit("Hearts") then
                card.ability.extra.chips = 1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.chips
            }
        end
    end
}