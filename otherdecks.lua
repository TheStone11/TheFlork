




SMODS.Back{
    name = "Overcharged Deck",
    key = "overcharged",
    atlas = "otherdecks",
    pos = {x = 2, y = 0},
    config = { hand_size = -1},
    loc_txt = {
        name ="Overcharged Deck",
        text={
            "Start with The Soul, -1 hand size",
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event( {
            func = function()
                SMODS.add_card{key = "c_soul"}
                return true
            end
        }))
    end
}

SMODS.Back {
    key = "eyesdeck",
    atlas = 'otherdecks',
    pos = { x = 3, y = 0 },
    loc_txt = {
        name ="Eyes Deck",
        text={
            "Start with only 13 :eyes: in deck"
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    if i <= 13 then
                        G.playing_cards[i]:change_suit("flynnset_eyes")
                    elseif i >= 14 then
                        G.playing_cards[i]:start_dissolve(nil, true)
                        G.GAME.starting_deck_size = #G.playing_cards
            
                    end
                end
                    return true
            end
        }))
 
    end,
}
