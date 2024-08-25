Config = {}

Config.Fishing = {
  FishingPosition = vector3(1338.26, 4225.35, 33.92), -- Change to opintial position here if you want. --

  FishPed = {
    PedModel = 'mp_m_exarmy_01', -- Ped Model --
    Position = vector3(-1849.89, -1230.43, 13.02), -- Position on Ped --
    PedHeading = 10.0,
    MaxMenuDistance = 1, -- How much distance you want to get up the menu --
  }, 

  Timeouts = {
    Timeout = 60000, -- How long you can fish after you have caught the number of fish you have set you can fish before Timoeut. --
    FishTimeout = 1,-- Add here how many times you want one to wait before they can fish again --
  },

  Target = vector3(-1849.98, -1229.38, 13.02),
  DrawMarker = vector3(-1849.89, -1230.43, 13.02),

  FishingItems = {
    [1] = 'fishitem1',
    [2] = 'fishitem2',
    [3] = 'fishitem3',
    [4] = 'fishingrod', -- FishingRod Item --
  },

  FishingPrices = {
    ['fishitem1'] = 5,
    ['fishitem2'] = 10,
    ['fishitem3'] = 15,
  },

  FishTypes = {
  { name = 'Small Fish', Size = 1, MinChance = 1, MaxChance = 50, Weight = { min = 1, max = 1 } }, -- Small Fish Settings --
  { name = 'Medium Fish', Size = 2, MinChance = 51, MaxChance = 80, Weight = { min = 1, max = 1 } }, -- Medium Fish Settings
  { name = 'Large Fish', Size = 3, MinChance = 81, MaxChance = 100, Weight = { min = 1, max = 1 } }, -- Large Fish Settings --
  },

  SkillCheck = {'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'}, {'w', 'a', 's'}, -- Skillcheck Settings --

  Pictures = {
    PictureOne = 'https://purepng.com/public/uploads/large/purepng.com-fishfoodfishanimalseamarineoceanseafoodaquatic-981524648553bwzqr.png',
    PictureTwo = 'https://purepng.com/public/uploads/large/purepng.com-fishfoodfishanimalseamarineoceanseafoodaquatic-981524648553bwzqr.png',
    PictureTre = 'https://purepng.com/public/uploads/large/purepng.com-fishfoodfishanimalseamarineoceanseafoodaquatic-981524648553bwzqr.png',
  },
  
  Money = 'cash', -- Set this to "bank" instead if you want to have your money in bank --
}


Config.BlipSettings = {
  {
    Blip = vector3(-1849.67, -1229.41, 13.02),
    TextOnMap = 'Fishing',
    BlipModel = 398,
    BlipColour = 2,
    showBlips = true,
  },
  -- Below is an example of how to add more "blips":)
--[[     {
    Blip = vector3(-1849.67, -1229.41, 13.02),
    TextOnMap = 'Sell Fishes',
    BlipModel = 398,
    BlipColour = 2,
    showBlips = true,
  } ]]
}



