
SMODS.Joker{ --The Mouth
    key = "themouth",
    config = {
        extra = {
            chips = 0,
            text = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Mouth',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+30{} Chips if played hand has already been played this round',
            [2] = '(Currently {C:blue}+#1#{})',
            [3] = '{C:inactive}thirst trap to get you to spam pairs{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                card.ability.extra.chips = (card.ability.extra.chips) + 30
                return {
                    message = "Upgrade!"
                }
            else
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}