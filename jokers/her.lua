
SMODS.Joker{ --HER
    key = "her",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'HER',
        ['text'] = {
            [1] = '{C:attention}6{}s become {C:attention}Steel Red-Seal Queens{} when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'thatoneatlaswiththefunnyfilename',
    pools = { ["flynnset_flynnset_jokers"] = true, ["flynnset_imscared"] = true, ["flynnset_female"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 6 then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Queen"))
                        scored_card:set_ability(G.P_CENTERS.m_steel)
                        scored_card:set_seal("Red", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "SIX WILL DO", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}