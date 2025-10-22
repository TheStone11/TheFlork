--hapodeck

SMODS.Atlas{
    key = 'hapodeckatlas',
    path = "hapodeck.png",
    px = 72,
    py = 95,
}


SMODS.Back{
    name = "Hapodeck",
    key = "hapoten",
    atlas = "hapodeckatlas",
    pos = {x = 0, y = 0},
    config = { hands = 1, discards = 0},
    loc_txt = {
        name ="Hapodeck",
        text={
            "Start with Hapoten",
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event( {
            func = function()
                SMODS.add_card{key = "j_flynnset_hapoten"}
                return true
            end
        }))
    end
}