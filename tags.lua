-- D6 Tag...?

SMODS.Atlas{
    key = 'dsixtag',
    path = "dsixtag.png",
    px = 34,
    py = 34,
}

SMODS.Atlas{
    key = 'flynnsane_tag_but_this_is_the_tags_atlas',
    path = "ModIcon.png",
    px = 34,
    py = 34,
}

SMODS.Tag {
    key = "tag_d6_gimmiko",
    min_ante = 2,
    loc_txt= {
        name = 'D6 Tag...?',
        text = { "Instantly open a Gimmiko booster pack", }},
    atlas = 'dsixtag',
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_flynnset_gimmikal_pack
    end,
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_flynnset_gimmikal_pack', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "flynnsane_tag",
    min_ante = 2,
    loc_txt= {
        name = 'FLYNNSANE TAG',
        text = { "Instantly open a Flunkle Pack", }},
    atlas = 'flynnsane_tag_but_this_is_the_tags_atlas',
    --YES i'm reusing the mod icon for this 
    --because i am lazy
    --and because i cooked when making it it's the best
    --also shoutouts to Miguel he didn't do anything but shoutouts to him anyway
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_flynnset_flunkle_pack
    end,
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Spectral, function()
                local booster = SMODS.create_card { key = 'p_flynnset_flunkle_pack', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}