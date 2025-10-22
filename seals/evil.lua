SMODS.Seal {
    key = 'evil',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            mult = -1,
            x_chips = 0.5,
            retrigger_times = 1
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
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            SMODS.calculate_effect({mult = card.ability.seal.extra.mult}, card)
            SMODS.calculate_effect({x_chips = card.ability.seal.extra.x_chips}, card)
        end
    end
}