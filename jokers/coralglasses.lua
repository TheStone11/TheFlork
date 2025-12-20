
SMODS.Joker{ --𝓯𝓻𝓮𝓪𝓴𝔂 Coral Glasses
    key = "coralglasses",
    config = {
        extra = {
            repetitions0 = 1,
            repetitions = 1,
            repetitions2 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Freaky Coral Glasses',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all played {C:attention}6s{}, {C:attention}9s{}, and {C:hearts}Hearts{} cards',
            [2] = '{C:inactive}i am going to touch you{}'
            --this is a reference to a sticker i spammed in my friend group's discord, being Coral Glasses sticking her tongue out in a funny manner
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
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
    atlas = 'CustomJokers2',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_female"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            elseif context.other_card:get_id() == 9 then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            elseif context.other_card:is_suit("Hearts") then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}