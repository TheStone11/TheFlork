SMODS.Consumable {
    key = 'look',
    set = 'Tarot',
    pos = { x = 0, y = 0 },
    atlas = "tarot",
    loc_txt = {
        name = 'Let\'s Take a Look Twin',
        text = {
        [1] = 'Convert up to 2 selected cards into :eyes:'
        }
    },
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge("Tarot????? what the fuck are we doing anymore", get_type_colour(self or card.config, card), nil, 1.2)
    end,
    config = { max_highlighted = 2, suit_conv = 'flynnset_eyes' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end
}