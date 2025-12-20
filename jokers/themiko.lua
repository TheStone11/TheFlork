
SMODS.Joker{ --The Miko
    key = "themiko",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Miko',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all played {C:attention}Enhanced{} cards',
            [2] = '{C:inactive}i\'m crine you don\'t know gimmiko and the crew like that{}'
            --this was born in a conversation with my friends where someone said "teach thinking i'm doing homework when i'm actually playing the miko" and i said "i'm crine you don't know gimmiko and the crew like that" 
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}