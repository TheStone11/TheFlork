
SMODS.Voucher {
    key = 'donation_box',
    pos = { x = 0, y = 1 },
    loc_txt = {
        name = 'Donation Box',
        text = {
            [1] = 'Obtain a {C:attention}D6 Tag...?{} at the end of the round',
            [2] = '{C:inactive}I think this belongs to Merci too{}'
        },
        unlock = {
            [1] = ''
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_flynnset_lucky_penny'},
    atlas = 'vouchers',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
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