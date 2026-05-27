SMODS.current_mod.menu_cards = function ()
    return {
        func = function ()
            local enh = SMODS.poll_enhancement{
                guaranteed = true,
                options = {
                    "m_lucky",
                    "m_steel",
                    "m_wild",
                    "m_gold",
                    "m_bonus"
                },
                key = tostring(os.time())
            }
            local card
            for i,v in ipairs(G.title_top.cards) do
                if v.is_suit and v:is_suit("Spades") then --Probably the vanilla ace of spades, that's what Minty says, sorry Minty!!
                    card = v
                    card:set_ability(enh)
                    assert(SMODS.change_base(card, "flynnset_eyes", "Ace"))
                    end
                    break
                end
            end
            }
        end