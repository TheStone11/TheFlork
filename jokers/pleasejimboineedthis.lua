
SMODS.Joker{ --Please Jimbo i NEED this!
    key = "pleasejimboineedthis",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Please Jimbo i NEED this!',
        ['text'] = {
            [1] = 'My {C:legendary}mom{} is kinda {C:attention}homeless...{}',
            [2] = '(creates a {C:tarot}Tarot{} card if played hand contains a {C:attention}Full House{})'
            },
            ['unlock'] = {
                [1] = 'Unlocked by default.'
            }
        },
        pos = {
            x = 0,
            y = 5
        },
        display_size = {
            w = 71 * 1, 
            h = 95 * 1
        },
        cost = 6,
        rarity = 3,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        unlocked = true,
        discovered = true,
        atlas = 'CustomJokers2',
        pools = { ["flynnset_flynnset_jokers"] = true },
        
        calculate = function(self, card, context)
            if context.cardarea == G.jokers and context.joker_main  then
                if next(context.poker_hands["Full House"]) then
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    return {
                        message = created_consumable and localize('k_plus_tarot') or nil
                    }
                end
            end
        end
    }