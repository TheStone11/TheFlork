--hapodeck

SMODS.Atlas{
    key = 'freakydeckatlas',
    path = "freakydeck.png",
    px = 72,
    py = 95,
}


SMODS.Back{
    name = "Freaky Deck",
    key = "freaky",
    atlas = "freakydeckatlas",
    pos = {x = 0, y = 0},
    config = { hands = 0, discards = 0},
    loc_txt = {
        name ="Freaky Deck",
        text={
            "Start with Balatinder",
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event( {
            func = function()
                SMODS.add_card{key = "j_flynnset_balatinder"}
                return true
            end
        }))
    end
}