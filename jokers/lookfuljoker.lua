SMODS.Joker {
    key = "lookful_joker",
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    loc_txt = {
      ['name'] = 'Lookful Joker',
      ['text'] = {
         [1] = 'Cards with the Eyes suit give {C:red}+5 Mult{}',
         [2] = '{C:inactive}Let\'s take a look twin{}',
      },
},      
    pools = { ["flynnset_flynnset_jokers"] = true },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    atlas = 'lookfuljokers',
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit("flynnset_Eyes") then
            return {
                mult = 5
            }
        end
    end
}