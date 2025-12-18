--the most unbalanced boss blinds in the game
SMODS.Atlas {
    key = "flynnblinds",
    path = "flynnblinds.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

--shoutouts to yeehaw mice for the code

SMODS.Blind {
    name = "boss_gzone",
    key = "boss_gzone",
    atlas = "flynnblinds",
    mult = 1.5,
    pos = { y = 0 },
    dollars = 6,
    loc_txt = {
        name = 'THE GZONE',
        --jigsaw: "yo final challenge, stop adding people you hate to your mod"
        --me: "aw hell nah yo ass tweaking jigsaw!"
        text = {
            'Debuffs most flynnsanity',
            'jokers',
            --it can't debuff detrimental jokers nor Flynnatic jokers 
        }
    },
    boss = {  min = 1 },
    boss_colour = HEX('00ccff'),

    recalc_debuff = function(self, card)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.flynnset_flynnset_jokers then
                G.jokers.cards[i]:set_debuff(true)
            end
            
        end
    end,

    disable = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,

    defeat = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,
}


--THE ABNORMALITY (currently commented out of the code)
--SMODS.Blind {
--    name = "The Abnormality",
--    key = "abnormality",
--    atlas = "flynnblinds",
--    mult = 2,
--    pos = { y = 1 },
--    dollars = 10,
--    loc_txt = {
--        name = 'THE ABNORMALITY',
--        text = {
--            'Unenhanced cards become',
--            'evil when scored',
--        }
--    },
--    boss = {  min = 7},
--    boss_colour = HEX('FF0000'),
--
--    debuff_hand = function(self)
--        for i = 1, #G.play.cards do
--            if G.play.cards[i].enhancement == nil then
--                SMODS.juice_up_blind()
--                G.play.cards[i]:set_seal("flynnset_evil",true,true)
--                delay(0.3)
--            end
--        end
--    end,


--}

SMODS.Blind {
    key = "excruciating_eric",
    atlas = "flynnblinds",
    pos = { y = 2 },
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("21d357"),
    loc_txt = {
        name = 'Excruciating Eric',
        text = {
            '-3 hand size',
    },
    
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
               G.hand:change_size(-3)
            end
        end
    end,
    disable = function(self)
        G.hand:change_size(3)
    end,
    defeat = function(self)
        if not G.GAME.blind.disabled then
            G.hand:change_size(3)
        end
    end
    },}
    

SMODS.Blind {
    key = "vicious_vollington",
    atlas = "flynnblinds",
    pos = { y = 3 },
    loc_txt = {
        name = "Vicious Vollington",
        text = {
            'After play or discard',
            'Only draw 2 cards',
            '+4 hand size',
        }
    },
    dollars = 8,
    mult = 1,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.drawing_cards and (G.GAME.current_round.hands_played ~= 0 or G.GAME.current_round.discards_used ~= 0) then
                return {
                    cards_to_draw = 2
                }
            end
        end

        if context.setting_blind then
            G.hand:change_size(4)  
        end
        defeat = function(self)
            G.hand:change_size(-4)
        end
    end,
    boss = { showdown = true },
    --boss_colour = HEX("435066")
    boss_colour = HEX("2f3179")
}

