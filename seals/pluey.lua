
SMODS.Seal {
    key = 'pluey',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            currenthandsize = 0
        }
    },
    badge_colour = HEX('EEFF0C'),
    loc_txt = {
        name = 'pluey',
        label = 'pluey',
        text = {
            [1] = 'erm what the plue?'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {(((G.hand and G.hand.config.card_limit or 0) or 0)) * 0.33}}
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            if G.hand and #G.hand.cards > 0 then
                SMODS.draw_cards(((G.hand and G.hand.config.card_limit or 0)) * 0.33)
            end
            return {
                message = "+"..tostring(((G.hand and G.hand.config.card_limit or 0)) * 0.33).." Cards Drawn"
            }
        end
    end
}


