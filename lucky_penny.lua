
SMODS.Voucher {
    key = 'lucky_penny',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Lucky Penny',
        text = {
            [1] = 'Obtain a {C:attention}D6 Tag...?{} when boss blind is defeated',
            [2] = '{C:inactive}Seems like it used to belong to Merci years in the past{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'vouchers',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_flynnset_tag_d6_gimmiko")
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end
                    }))
                    return true
                end,
                message = "Created Tag!"
            }
        end
    end
}