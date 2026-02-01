
SMODS.Joker{ --Castle Kid
    key = "castlekid",
    config = {
        extra = {
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Castle Kid',
        ['text'] = {
            [1] = 'Levels up your {C:attention}most played hand{} once when a {C:attention}Tag{} is added'
            --this joker gets really damn broken with Restorer, HER, and White Face.
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
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
    atlas = 'thatoneatlaswiththefunnyfilename',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_imscared"] = true },
    
    calculate = function(self, card, context)
        if context.tag_added  then
            local temp_played = 0
            local temp_order = math.huge
            local target_hand
            for hand, value in pairs(G.GAME.hands) do 
                if value.played > temp_played and value.visible then
                    temp_played = value.played
                    temp_order = value.order
                    target_hand = hand
                elseif value.played == temp_played and value.visible then
                    if value.order < temp_order then
                        temp_order = value.order
                        target_hand = hand
                    end
                end
            end
            
            level_up_hand(card, target_hand, true, 1)
            return {
                message = localize('k_level_up_ex')
            }
        end
    end
}