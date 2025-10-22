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
    key = "flynnsane",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('0dff9b'),
    loc_txt = {
        name = "FLYNNSANE"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}