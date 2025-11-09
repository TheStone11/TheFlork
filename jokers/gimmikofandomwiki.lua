SMODS.Joker{ --Gimmiko Fandom Wiki
    key = "gimmikofandomwiki",
    config = {
        extra = {
            chips = 250,
            odds = 6,
            start_dissolve = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gimmiko Fandom Wiki',
        ['text'] = {
            [1] = '{C:blue}+250{} Chips,  {C:green}#3# in #4# {}chance to be destroyed at the end of the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flynnset_flynnset_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and G.GAME.pool_flags.flynnset_wikialive
      end,

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flynnset_gimmikofandomwiki') 
        return {vars = {card.ability.extra.n, card.ability.extra.start_dissolve, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    if context.cardarea == G.hand and context.end_of_round  then
    end
if context.end_of_round and context.game_over == false and context.main_eval  then
    if true then
        if SMODS.pseudorandom_probability(card, 'group_0_abc220d3', 1, card.ability.extra.odds, 'j_flynnset_gimmikofandomwiki', false) then
                SMODS.calculate_effect({func = function()
                    card:start_dissolve()
                    return true
                    end}, card)
                end
            end
        end
    end
}