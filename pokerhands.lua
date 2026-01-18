SMODS.PokerHandPart {
    key = "delicacy",
    func = function (hand)
        if #hand < 3 then return {} end

        local track_ranks = {}

        for _,card in ipairs(hand) do
            local rank = card:get_id()
            track_ranks[rank] = track_ranks[rank] or {}
            table.insert(track_ranks[rank], card)
        end

        if not (
            -- A rank is not tracked if the rank is not in the hand
            track_ranks[4]     -- 4s
            and track_ranks[9] -- 9s
            and track_ranks[14] -- ...Aces
        ) then return {} end

        local scoring_cards = SMODS.merge_lists{
            track_ranks[4],
            track_ranks[9],
            track_ranks[14]
        }

        return {scoring_cards}
    end
}

SMODS.PokerHand({
    key = "delicacy",
    mult = 4,
    chips = 91,
    l_mult = 2,
    l_chips = 15,
    example = {
        { 'S_4', true }, 
        { 'D_9', true },
        { 'H_8', false, enhancement = 'm_lucky' }, 
        { 'S_A', true },
        { 'D_J', false }
    },
    loc_txt = {
        name = "Delicacy",
        description = {"A hand containing a 4, a 9, and an Ace"},
    },
    visible = true,

    evaluate = function(parts, hand)
        return parts.delicacy
    end,


    modify_display_text = function(self, cards, scoring_hand)
        return delicacy
    end,
})