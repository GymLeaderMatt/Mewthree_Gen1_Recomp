-- Adds Mewthree (#153), a fusion of Mewtwo and Mew. It learns every TM
-- and HM in the game.
return function(mod)

  local TMHM_MOVES = {
    "MEGA_PUNCH", "RAZOR_WIND", "SWORDS_DANCE", "WHIRLWIND", "MEGA_KICK",
    "TOXIC", "HORN_DRILL", "BODY_SLAM", "TAKE_DOWN", "DOUBLE_EDGE",
    "BUBBLEBEAM", "WATER_GUN", "ICE_BEAM", "BLIZZARD", "HYPER_BEAM",
    "PAY_DAY", "SUBMISSION", "COUNTER", "SEISMIC_TOSS", "RAGE",
    "MEGA_DRAIN", "SOLARBEAM", "DRAGON_RAGE", "THUNDERBOLT", "THUNDER",
    "EARTHQUAKE", "FISSURE", "DIG", "PSYCHIC_M", "TELEPORT",
    "MIMIC", "DOUBLE_TEAM", "REFLECT", "BIDE", "METRONOME",
    "SELFDESTRUCT", "EGG_BOMB", "FIRE_BLAST", "SWIFT", "SKULL_BASH",
    "SOFTBOILED", "DREAM_EATER", "SKY_ATTACK", "REST", "THUNDER_WAVE",
    "PSYWAVE", "EXPLOSION", "ROCK_SLIDE", "TRI_ATTACK", "SUBSTITUTE",
    "CUT", "FLY", "SURF", "STRENGTH", "FLASH",
  }

  -- A color set matching the sprite, used as a backup wherever the
  -- game needs a palette.
  mod.content.palettes:register("MTHREEMON", {
    { 255, 255, 255 },   -- background
    { 255, 123, 255 },   -- pink
    { 57, 90, 214 },     -- blue
    { 0, 0, 0 },         -- near-black
  })

  local sprite = mod.path .. "/assets/sprites/mewthree.png"

  mod.content.pokemon:register("MEWTHREE", {
    id = "MEWTHREE", name = "MEWTHREE", dex = 153,
    types = { "PSYCHIC_TYPE" },
    baseStats = { hp = 100, attack = 105, defense = 100,
                  speed = 130, special = 154 },
    catchRate = 3, baseExp = 255,
    growthRate = "MEDIUM_SLOW",
    level1Moves = { "PSYCHIC_M", "CONFUSION", "TRANSFORM", "SWIFT" },
    learnset = {
      { level = 63, move = "BARRIER" },
      { level = 66, move = "PSYCHIC_M" },
      { level = 70, move = "RECOVER" },
      { level = 75, move = "MIST" },
      { level = 81, move = "AMNESIA" },
    },
    tmhm = TMHM_MOVES,
    evolutions = {},
    spriteFront = sprite,
    spriteBack = sprite,      -- same art for both
    frontSize = 4,            -- 56x56 art, no scaling needed
    trueColor = true,         -- keep the sprite's own colors
    palette = "MTHREEMON",    -- backup color set for anything that
                              -- ignores trueColor
    battleScaleFront = 1,     -- art is already the right size
    battleScaleBack = 1,
    dexEntry = {
      kind = "FUSION", heightFt = 5, heightIn = 3, weight = 187.4,
      text = "MEW and MEWTWO were\nmade one. Its power\nanswers to no one.",
    },
  })

  mod.content.icons:register("MEWTHREE", "MON")
  mod.content.cries:register("MEWTHREE", { base = "PIDGEY" })
end
