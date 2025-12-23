
SMODS.Booster {
    key = 'flunkle_pack',
    loc_txt = {
        name = "Flunkle Pack",
        text = {
            [1] = 'Pick {C:attention}1{} of {C:attention}3{} Flynnsanity jokers'
        },
        group_name = "flynnset_boosters"
    },
    config = { extra = 3, choose = 1 },
    weight = 10,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "flynnset_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "flynnset_flynnset_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flynnset_flunkle_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("007d3e"))
        ease_background_colour({ new_colour = HEX('007d3e'), special_colour = HEX("00ff6d"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'what',
        loc_txt = {
            name = "what",
            text = {
                [1] = 'what'
            },
            group_name = "flynnset_boosters"
        },
        config = { extra = 3, choose = 1 },
        weight = 4,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        group_key = "flynnset_boosters",
        select_card = "consumeables",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "what_are_these",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flynnset_what"
            }
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("c3ff00"))
            ease_background_colour({ new_colour = HEX('c3ff00'), special_colour = HEX("e6ff00"), contrast = 2 })
        end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                timer = 0.015,
                scale = 0.2,
                initialize = true,
                lifespan = 1,
                speed = 1.1,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
    }
    
    
    SMODS.Booster {
        key = 'oh_god_what_the_hell',
        loc_txt = {
            name = "Mega Standard Pack...?",
            text = {
                [1] = '???'
            },
            group_name = "flynnset_boosters"
        },
        config = { extra = 64, choose = 5 },
        cost = 25,
        weight = 0.3,
        atlas = "CustomBoosters",
        pos = { x = 2, y = 0 },
        group_key = "flynnset_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "Playing Card",
                rank = "2",
                enhancement = "m_stone",
                edition = "e_negative",
                seal = "flynnset_pluey",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flynnset_oh_god_what_the_hell"
            }
        end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                timer = 0.015,
                scale = 0.3,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = { G.C.BLACK, G.C.RED },
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
    }
    
    
    SMODS.Booster {
        key = 'gimmikal_pack',
        loc_txt = {
            name = "Gimmikal Pack",
            text = {
                [1] = 'Choose 1 of 3 Gimmiko jokers'
                -- flynn try not to shoehorn his hyperfixation on gimmiko into everything challenge (IMPOSSIBLE)
                -- also btw i do NOT support the creator of gimmiko in any way because that guy's a huge jerk 
                -- and i hate him
                -- not really him but G-Zone like tfym you incited harassment towards me you bitch
            },
            group_name = "flynnset_boosters"
        },
        config = { extra = 3, choose = 1 },
        atlas = "CustomBoosters",
        pos = { x = 3, y = 0 },
        group_key = "flynnset_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "flynnset_gimmiko",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flynnset_gimmikal_pack"
            }
        end,
        ease_background_colour = function(self)
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        