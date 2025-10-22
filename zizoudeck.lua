--sneesnaw

SMODS.Atlas{
    key = 'zizouatlas',
    path = "zizoudeck.png",
    px = 72,
    py = 95,
}


SMODS.Back{
    name = "Zizou Deck",
    key = "zizoudeck",
    atlas = "zizouatlas",
    pos = {x = 0, y = 0},
    config = { hands = 0, discards = 0},
    loc_txt = {
        name ="that one message zizou sent me",
        text={
            "Start with Zizou",
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event( {
            func = function()
                SMODS.add_card{key = "j_flynnset_zizou"}
                return true
            end
        }))
    end
}