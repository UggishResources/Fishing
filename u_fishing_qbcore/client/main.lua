local QBCore = exports['qb-core']:GetCoreObject()
local fishingSpot = Config.Fishing.FishingPosition
local FishTypes = Config.Fishing.FishTypes
local pedCoords = Config.Fishing.FishPed.Position
local fishing = false
local fishingCount = 0
local fishingTimeout = false
local PedHeading = Config.Fishing.FishPed.PedHeading

Citizen.CreateThread(function()
    local pedModel = GetHashKey(Config.Fishing.FishPed.PedModel)
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(10)
    end

   local ped = CreatePed(4, pedModel, pedCoords.x, pedCoords.y, pedCoords.z, PedHeading, true, true)
    SetEntityCanBeDamaged(ped, false)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)
end)


    RegisterNetEvent('uggishresources:client:fishingmenu')
    AddEventHandler('uggishresources:client:fishingmenu', function()
        lib.registerContext({
            id = 'uggishfishing_menu',
            title = Lang:t('info.fish_menu_headertext'),
            options = {
                {
                    title = Lang:t('info.fish_info_start'),
                    icon = 'arrow-right',
                    args = {}
                },
                {
                    title = Lang:t('info.need_fishrod'),
                    icon = 'info',
                    event = 'u-fishing:client:FishingRod'
                },
                {
                    title = Lang:t('info.fish_info_sell'),
                    description = Lang:t('info.desc_fishingmenu'),
                    icon = 'fish',
                    event = 'u-fishing:client:RequestFishCounts', 
                }
            }
        })
        lib.showContext('uggishfishing_menu')
    end)

    -- Target
    exports.ox_target:addBoxZone({
        coords = Config.Fishing.Target,
        size = vec3(2, 2, 2),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'box',
                event = 'uggishresources:client:fishingmenu',
                icon = '',
                label = Lang:t('info.target'),
            }
        }
    })

RegisterNetEvent('u-fishing:client:FishesMenu', function(fishCounts)
    lib.registerContext({
        id = 'fishing_menu',
        title = 'Fishing Items',
        menu = 'uggishfishing_menu',
        options = {
            {
                title = Lang:t('info.fishing_itemone_title'),
                description = string.format(Lang:t('info.fishing_items_desc') .. Lang:t('info.price_fish') .. '\nFishes: %d', Config.Fishing.FishingPrices[Config.Fishing.FishingItems[1]], fishCounts[1]),
                icon = Config.Fishing.Pictures.PictureOne,
                event = 'u-fishing:client:FishingSellItemOne',
            },
            {
                title = Lang:t('info.fishing_itemtwo_title'),
                description =  string.format(Lang:t('info.fishing_items_desc') .. Lang:t('info.price_fish') .. '\nFishes: %d', Config.Fishing.FishingPrices[Config.Fishing.FishingItems[2]], fishCounts[2]),
                icon = Config.Fishing.Pictures.PictureTwo,
                event = 'u-fishing:client:FishingSellItemTwo',

            },
            {
                title = Lang:t('info.fishing_itemtre_title'),
                description = string.format(Lang:t('info.fishing_items_desc') .. Lang:t('info.price_fish') .. '\nFishes: %d', Config.Fishing.FishingPrices[Config.Fishing.FishingItems[3]], fishCounts[3]),
                icon = Config.Fishing.Pictures.PictureTre,
                event = 'u-fishing:client:FishingSellItemTre'

            }
        }
    })

    lib.showContext('fishing_menu')
end)

-- Sell Fishes Events
RegisterNetEvent('u-fishing:client:FishingSellItemOne')
AddEventHandler('u-fishing:client:FishingSellItemOne', function()
    TriggerServerEvent('u-fishing:server:FishingSellItemsOne')
end)

RegisterNetEvent('u-fishing:client:FishingSellItemTwo')
AddEventHandler('u-fishing:client:FishingSellItemTwo', function()
    TriggerServerEvent('u-fishing:server:FishingSellItemsTwo')
end)

RegisterNetEvent('u-fishing:client:FishingSellItemTre')
AddEventHandler('u-fishing:client:FishingSellItemTre', function()
    TriggerServerEvent('u-fishing:server:FishingSellItemsTre')
end)

RegisterNetEvent('u-fishing:client:FishingRod')
AddEventHandler('u-fishing:client:FishingRod', function()
    TriggerServerEvent('u-fishing:server:FishingRod')
end)

RegisterNetEvent('u-fishing:client:RequestFishCounts')
AddEventHandler('u-fishing:client:RequestFishCounts', function()
    TriggerServerEvent('u-fishing:server:FishCountInfo')
end)
-- Notifications that come up when you caught a fish / sold a fish / if you have done something wrong.
RegisterNetEvent('u-fishing:client:ShowFishAlert')
AddEventHandler('u-fishing:client:ShowFishAlert', function(fishName, fishWeight)
    local alert = lib.alertDialog({
        content = Lang:t('info.fish') .. fishName .. ' Weighing ' .. fishWeight .. ' KG. ',
        centered = true,
        cancel = true
    })

    print(alert)

    lib.notify({
        description = Lang:t('info.sellitem_toped'),
        type = 'success'
    })
    Citizen.Wait(10000)
end)

-- 2 --
RegisterNetEvent('u-fishing:client:ShowFishAlertOne')
AddEventHandler('u-fishing:client:ShowFishAlertOne', function(totalEarnings)
    local alert = lib.alertDialog({
        content = Lang:t('info.sold_fish') .. totalEarnings .. ' $!',
        centered = true,
        cancel = true
    })
end)

-- 3 --
RegisterNetEvent('u-fishing:client:ShowFishAlertTwo')
AddEventHandler('u-fishing:client:ShowFishAlertTwo', function(totalEarnings)
    local alert = lib.alertDialog({
        content = Lang:t('info.sold_fish') .. totalEarnings .. ' $!',
        centered = true,
        cancel = true
    })
end)

-- 4 --
RegisterNetEvent('u-fishing:client:ShowFishAlertTre')
AddEventHandler('u-fishing:client:ShowFishAlertTre', function(totalEarnings)
    local alert = lib.alertDialog({
        content = Lang:t('info.sold_fish') .. totalEarnings .. ' $!',
        centered = true,
        cancel = true
    })
end)

-- 5 --
RegisterNetEvent('u-fishing:client:ShowFishAlertOneError')
AddEventHandler('u-fishing:client:ShowFishAlertOneError', function(totalEarnings)
    local alert = lib.alertDialog({
        content = Lang:t('error.try_to_sellfish'),
        centered = true
    })
end)

-- 6 --
RegisterNetEvent('u-fishing:client:ShowFishAlertTwoError')
AddEventHandler('u-fishing:client:ShowFishAlertTwoError', function(totalEarnings)
    local alert = lib.alertDialog({
        content = Lang:t('error.try_to_sellfish'),
        centered = true
    })
end)

-- 7 --
RegisterNetEvent('u-fishing:client:ShowFishAlertTreError')
AddEventHandler('u-fishing:client:ShowFishAlertTreError', function(totalEarnings)
    local alert = lib.alertDialog({
        content = Lang:t('error.try_to_sellfish'),
        centered = true
    })
end)

-- 8 --
RegisterNetEvent('u-fishing:client:ShowFishingrodNoti')
AddEventHandler('u-fishing:client:ShowFishingrodNoti', function()
    lib.notify({
        title = 'Fishing Rod',
        description = Lang:t('info.fishingrod'),
        type = 'success',
        wait = 6000
    })
end)


Citizen.CreateThread(function()
    local center = Config.Fishing.DrawMarker
     
    local point = lib.points.new({
        coords = center,
        distance = 20,
    })
     
    local marker = lib.marker.new({
        coords = center,
        type = 1,
    })
     
    function point:nearby()
        marker:draw()

        if self.currentDistance < 1.5 and IsControlJustPressed(0, 51) then
            if fishingTimeout then
                lib.notify({
                    description = Lang:t('error.timeout_fish_again'),
                    type = 'error'
                })
                return
            end

            if hasFishingRod() then
                lib.notify({
                    title = 'Starting Fishing',
                    description = 'You are starting to fish!',
                    type = 'success',
                    wait = 5000
                })
                startFishing()  -- Assuming this function starts the fishing process
            else 
                lib.notify({
                    description = Lang:t('error.no_fishingrod'),
                    type = 'error'
                })
            end
        end
    end
end)

function hasFishingRod()
    local Player = QBCore.Functions.GetPlayerData()
    for _, item in pairs(Player.items) do
        if item.name == Config.Fishing.FishingItems.FishingRod then
            return true
        end
    end
    return false
end

function startFishing()
    local Player = QBCore.Functions.GetPlayerData()

    if not hasFishingRod() then 
        lib.notify({
            description = Lang:t('error.no_fishingrod'),
            type = 'error'
        })
        return 
    end

    if fishingTimeout then
        lib.notify({
            description = Lang:t('error.timeout_fish_again'),
            type = 'error'
        })
        return
    end 

    fishing = true
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_FISHING', 'idle_c', 10000, true)
    Citizen.Wait(10000) 
    local SkillCheck = lib.skillCheck(Config.Fishing.SkillCheck)

    if not SkillCheck then
        lib.notify({
            description = Lang:t('error.not_fish'),
            type = 'error'
        })
        ClearPedTasks(playerPed)
        fishing = false
        return
    end 

    local rand = math.random(1, 100)
    local fishType = nil

    for _, fish in ipairs(FishTypes) do
        if rand >= fish.MinChance and rand <= fish.MaxChance then
            fishType = fish
            break
        end
    end

    if fishType then
        local Weight = math.random(fishType.Weight.min, fishType.Weight.max)
        TriggerServerEvent('u-fishing:server:FishingItem', fishType, Weight)
    end

    ClearPedTasks(playerPed)
    fishing = false 

    fishingCount = fishingCount + 1

    if fishingCount >= Config.Fishing.Timeouts.FishTimeout then
        fishingTimeout = true 
--[[         lib.notify({
            description = Lang:t('error.timeout_fish'),
            type = 'error'
        }) ]]
        Citizen.SetTimeout(Config.Fishing.Timeouts.Timeout, function()
            fishingCount = 0
            fishingTimeout = false 
            lib.notify({
                description = Lang:t('info.fish_again'),
                type = 'success'
            })
        end)
    end
end

Citizen.CreateThread(function()
    Citizen.Wait(10)

    for _, blipConfig in pairs(Config.BlipSettings) do 
        if blipConfig.showBlips then 

            local blipCoords = blipConfig.Blip
            local uggishresourcesBlip = AddBlipForCoord(blipCoords.x, blipCoords.y, blipCoords.z)

            SetBlipAsShortRange(uggishresourcesBlip, true)
            SetBlipColour(uggishresourcesBlip, blipConfig.BlipColour)
            SetBlipSprite(uggishresourcesBlip, blipConfig.BlipModel)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blipConfig.TextonMap)
            EndTextCommandSetBlipName(uggishresourcesBlip)
        end
    end
end)



