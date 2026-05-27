SMODS.Rarity {
    key = "evil",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ff001f'),
    loc_txt = {
        name = "EVIL"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "flynnatic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('0dff9b'),
    loc_txt = {
        name = "FLYNNATIC"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "minusb",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "-b"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}