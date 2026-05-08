


SMODS.Back{
    name = "Flynn Deck",
    key = "Flynn Deck",
    atlas = "otherdecks",
    pos = {x = 0, y = 0},
    config = { hands = 1, discards = 0},
    loc_txt = {
        name ="Flynn Deck",
        text={
            "Start with Flynn herself",
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event( {
            func = function()
                SMODS.add_card{key = "c_flynnset_flunkleflynnoid"}
                return true
            end
        }))
    end
}