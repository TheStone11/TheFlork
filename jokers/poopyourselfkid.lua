
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
<<<<<<< HEAD
            [1] = '{C:red}+5{} Mult for every {C:important}Flush{} you played this run',
=======
            [1] = '{C:red}+5{} Mult for every Flush you played this run',
>>>>>>> 1d9e02498e9b9e2a1fe0575e73a6890f74001664
            [2] = 'This joker does not condone the actions of G-Zone btw.'
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((G.GAME.hands['Flush'].played or 0)) * 5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (G.GAME.hands['Flush'].played) * 5
            }
        end
    end
}