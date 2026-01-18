SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "sappy", 
    path = "sappy.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}) 

SMODS.Atlas({
    key = "hapoverse", 
    path = "hapoverse.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}) 

SMODS.Atlas({
    key = "legendaries", 
    path = "legendaries.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}) 

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers2", 
    path = "jokers2revengeoftherobots.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "vouchers", 
    path = "vouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

--jonklers load order
local jokerIndexList = {6,10,49,34,21,53,18,20,48,42,52,41,29,4,47,22,5,13,11,40,38,35,25,26,45,37,3,16,1,44,39,51,9,19,2,15,33,24,50,43,36,31,32,14,46,28,7,12,52,27,17,23}
--local jokerIndexList = {6,10,49,34,21,18,20,48,42,52,53,54,41,29,4,47,22,5,13,11,40,38,35,25,26,45,37,3,16,1,44,39,51,9,19,2,15,33,24,50,43,36,31,32,14,46,28,7,12,52,27,17,23}


local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {3,1,5,4,2}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end



local sealIndexList = {2,1}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()


--assert(SMODS.load_file("pokerhands.lua"))()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end


--This loads the legendary jokers 
assert(SMODS.load_file("redfix.lua"))()
assert(SMODS.load_file("yellofix.lua"))()
assert(SMODS.load_file("sunthing.lua"))()
assert(SMODS.load_file("murderguy.lua"))()
assert(SMODS.load_file("jaymon.lua"))()

assert(SMODS.load_file("lucky_penny.lua"))()
assert(SMODS.load_file("donation_box.lua"))()

assert(SMODS.load_file("sounds.lua"))()

--hapoten is your favorite character (not up for debate)
assert(SMODS.load_file("hapodeck.lua"))()

--the evil and fucked-up file from hell that makes jumpscares, shoutouts to Nxkoo for giving me the code for this file, WE love you Nxkoo
assert(SMODS.load_file("jumpscare.lua")) 

--flynn when the hell did i make a freaky deck man that's wild
assert(SMODS.load_file("freakydeck.lua"))()

--this deck doesn't support Zizou
assert(SMODS.load_file("zizoudeck.lua"))()

--flynn deck because i made the mod and i want a deck named after me because i am lowkey narcissistic
assert(SMODS.load_file("flynndeck.lua"))()

--this thingamajig loads the tags
assert(SMODS.load_file("tags.lua"))()

--this line loads the boss blinds
assert(SMODS.load_file("blinds.lua"))()

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_seals_folder()
SMODS.ObjectType({
    key = "flynnset_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "flynnset_flynnset_jokers",
    --most of the mod's jokers, G-Zone might debuff these jokers
    cards = {
        ["j_flynnset_allkelsgotoheaven"] = true,
        ["j_flynnset_astro"] = true,
        ["j_flynnset_balatinder"] = true,
        ["j_flynnset_bingus"] = true,
        ["j_flynnset_cat"] = true,
        ["j_flynnset_coralglasses"] = true,
        ["j_flynnset_dualityofman"] = true,
        ["j_flynnset_gimmiko"] = true,
        ["j_flynnset_gimmikofandomwiki"] = true,
        ["j_flynnset_grandpa"] = true,
        ["j_flynnset_hapoten"] = true,
        ["j_flynnset_ihighlyrecommendyouchooseseal"] = true,
        ["j_flynnset_ika"] = true,
        ["j_flynnset_jackson"] = true,
        ["j_flynnset_jimbojr"] = true,
        ["j_flynnset_joki"] = true,
        ["j_flynnset_jokiffjokaff"] = true,
        ["j_flynnset_ladykaguya"] = true,
        ["j_flynnset_lenam"] = true,
        ["j_flynnset_markiplierinhospitalgif"] = true,
        ["j_flynnset_marysue"] = true,
        ["j_flynnset_mercury"] = true,
        ["j_flynnset_monaka"] = true,
        ["j_flynnset_nikola"] = true,
        ["j_flynnset_poopyourselfkid"] = true,
        ["j_flynnset_ratoncito"] = true,
        ["j_flynnset_shogunateofcrows"] = true,
        ["j_flynnset_sprue"] = true,
        ["j_flynnset_theeye"] = true,
        ["j_flynnset_thehook"] = true,
        ["j_flynnset_themiko"] = true,
        ["j_flynnset_themouth"] = true,
        ["j_flynnset_theplant"] = true,
        ["j_flynnset_zizou"] = true,
        ["j_flynnset_zo"] = true,
        ["j_flynnset_flynnling"] = true,
        ["j_flynnset_yukionna"] = true,
        ["j_flynnset_gozu"] = true,
        ["j_flynnset_jacktheripper"] = true,
        ["j_flynnset_kokurrisan"] = true
    },
})

SMODS.ObjectType({
    --funny anecdote i was watching someone play the mod and had Balatinder and got really confused why was Egg considered a woman but i remembered i put it here
    key = "flynnset_female",
    cards = {
        ["j_flynnset_cat"] = true,
        ["j_flynnset_hapoten"] = true,
        ["j_flynnset_ika"] = true,
        ["j_flynnset_sprue"] = true,
        ["j_flynnset_theeye"] = true,
        ["j_flynnset_thehook"] = true,
        ["j_flynnset_themouth"] = true,
        ["j_flynnset_theplant"] = true,
        ["j_flynnset_zo"] = true,
        ["j_flynnset_monaka"] = true,
        ["j_blueprint"] = true,
        ["j_brainstorm"] = true,
        ["j_throwback"] = true,
        ["j_flynnset_mercury"] = true,
        ["j_flynnset_monaka"] = true,
        ["j_flynnset_ladykaguya"] = true,
        ["j_flynnset_yukionna"] = true,
        ["j_egg"] = true
    },
})

SMODS.ObjectType({
    --gimmiko set because i cannot stop thinking about gimmiko, these jokers can be summoned by the Gimmikon's Charm consumable
    key = "flynnset_gimmiko",
    cards = {
        ["j_flynnset_gimmiko"] = true,
        ["j_flynnset_gozu"] = true,
        ["j_flynnset_ika"] = true,
        ["j_flynnset_jacktheripper"] = true,
        ["j_flynnset_kokurrisan"] = true,
        ["j_flynnset_ladykaguya"] = true,
        ["j_flynnset_lenam"] = true,
        ["j_flynnset_marysue"] = true,
        ["j_flynnset_mercury"] = true,
        ["j_flynnset_monaka"] = true,
        ["j_flynnset_picasso"] = true,
        ["j_flynnset_shogunateofcrows"] = true,
        ["j_flynnset_sprue"] = true,
        ["j_flynnset_themiko"] = true,
        ["j_flynnset_yukionna"] = true,
        ["j_flynnset_zo"] = true
    }, 
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end

--Dilecta Uxor and Monaka may only appear if you have Cryptid installed
if next(SMODS.find_mod("Cryptid")) then
   assert(SMODS.load_file("dilectauxor.lua"))()
end

--ignore these lol i'm just tryna load neonflame crossmod
if next(SMODS.find_mod("Neonflame")) then
   assert(SMODS.load_file("yukionna.lua"))()
end

if next(SMODS.find_mod("neonflames")) then
   assert(SMODS.load_file("yukionna.lua"))()
end

if next(SMODS.find_mod("nflame")) then
   assert(SMODS.load_file("yukionna.lua"))()
end