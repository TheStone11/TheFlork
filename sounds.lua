SMODS.Sound{
    key="wooshpetscop",
    path="wooshpetscop.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="bonebreak",
    path="bonebreak.ogg",
    pitch=0.7,
    volume=0.6,
}

SMODS.Sound{
    key="evil",
    path="evil.ogg",
    pitch=0.7,
    volume=0.6,
}

--this thing only plays if you have a Flynnatic joker
SMODS.Sound({
        key = "music_flynn",
        path = "Poker de Moscas.ogg", -- means "Fly Poker" in Spanish
        sync = true,
        pitch = 1,
        select_music_track = function()
        if not (G.jokers and G.jokers.cards) then return false end
        for _,joker in ipairs(G.jokers.cards) do
          if joker.config.center.rarity == "flynnset_flynnatic" then return true end
        end
        return false
    end
})

SMODS.Sound({
        key = "music_minusb",
        path = "minus-b.ogg", --Music by Lil Yappa
        sync = false,
        pitch = 1,
        select_music_track = function()
        if not (G.jokers and G.jokers.cards) then return false end
        for _,joker in ipairs(G.jokers.cards) do
           if joker.config.center.rarity == "flynnset_minusb" then return true end
        end
        return false
    end
})