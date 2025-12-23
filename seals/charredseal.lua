
SMODS.Seal {
    key = 'charredseal',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            levels0 = 1
        }
    },
    badge_colour = HEX('#65d365ff'),
    loc_txt = {
        name = 'Charred Seal',
        label = 'Charred Seal',
        text = {
            [1] = '{C:attention}Levels up{} discarded hand when discarded'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            local target_hand
            target_hand = context.scoring_name or "High Card"
            return {
                level_up = 1,
                level_up_hand = target_hand,
                message = localize('k_level_up_ex')
            }
        end
    end
}