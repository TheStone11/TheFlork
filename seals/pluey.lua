
SMODS.Seal {
    key = 'pluey',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            emult0 = 1.1,
            retrigger_times0 = 1
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'pluey',
        label = 'pluey',
        text = {
            [1] = 'a custom PLUEY with custom effects'
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
                e_mult = 1.1
            }
        end
    end
}