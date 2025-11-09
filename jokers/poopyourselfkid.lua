SMODS.Joker{ --Poop Yourself, Kid
    key = "poopyourselfkid",
    config = {
        extra = {
            flushplayed = 0
        }
    },
    loc_txt = {
        ['name'] = 'Poop Yourself, Kid',
        ['text'] = {
            [1] = '{C:red}+5{} Mult for every Flush you played this run'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (G.GAME.hands['Flush'].played) * 5
            }
        end
    end
}