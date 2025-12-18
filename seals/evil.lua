
SMODS.Seal {
    key = 'evil',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            mult0 = -1,
            xchips0 = 0.5,
            retrigger_times0 = 1
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Evil',
        label = 'Evil',
        text = {
            [1] = '{C:red}-1{} Mult when this card is scored, {X:chips,C:white}X0.5{} Chips'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 1
            return {
                mult = -1,
                extra = {
                    x_chips = 0.5,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}