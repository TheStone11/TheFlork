SMODS.Joker{ --Gimmiko
    key = "gimmiko",
    config = {
        extra = {
            GimmikalChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gimmiko',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+75{} Chips when a {C:attention}Lucky{} card successfully triggers',
            [2] = '(Currently{C:blue} +#1# {}Chips)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_gimmiko"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_lucky"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.GimmikalChips}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.lucky_trigger then
                card.ability.extra.GimmikalChips = (card.ability.extra.GimmikalChips) + 75
                return {
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.GimmikalChips
            }
        end
    end
}