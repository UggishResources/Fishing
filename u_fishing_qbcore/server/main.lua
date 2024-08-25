QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('u-fishing:server:FishingItem')
AddEventHandler('u-fishing:server:FishingItem', function(fishType, Weight)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        local item = Config.Fishing.FishingItems[fishType.Size]
        if item then
            Player.Functions.AddItem(item, Weight)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
        end

        --[[ TriggerClientEvent('QBCore:Notify', src, Lang:t('info.fish') .. fishType.name .. ' weighing, ' .. Weight .. ' KG!', 'success') ]]
        TriggerClientEvent('u-fishing:client:ShowFishAlert', src, fishType.name, Weight)
    end
end)

RegisterNetEvent('u-fishing:server:FishingRod')
AddEventHandler('u-fishing:server:FishingRod', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then 
        local item = Config.Fishing.FishingItems.FishingRod
        if item then
            Player.Functions.AddItem(item, 1) 
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add') 
        end

        TriggerClientEvent('u-fishing:client:ShowFishingrodNoti', src)
   end
end)

 
RegisterNetEvent('u-fishing:server:FishingSellItemsOne')
AddEventHandler('u-fishing:server:FishingSellItemsOne', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalEarnings = 0

    if Player then 
        local fishItem = Config.Fishing.FishingItems[1]
            local item = Player.Functions.GetItemByName(fishItem)
            if item and item.amount > 0 then 
                Player.Functions.RemoveItem(fishItem, item.amount)
                totalEarnings = totalEarnings + (Config.Fishing.FishingPrices[fishItem] * item.amount)
            end
            
        if totalEarnings > 0 then 
            Player.Functions.AddMoney(Config.Fishing.Money, totalEarnings, 'sold-fish')
            TriggerClientEvent('u-fishing:client:ShowFishAlertOne', src, totalEarnings)
        else
            TriggerClientEvent('u-fishing:client:ShowFishAlertOneError', src, totalEarnings)
        end
    end
end)

RegisterNetEvent('u-fishing:server:FishCountInfo', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local fishCounts = {}
        for i, fishItem in ipairs(Config.Fishing.FishingItems) do 
        local item = Player.Functions.GetItemByName(fishItem)
        fishCounts[i] = item and item.amount or 0
        end
        TriggerClientEvent('u-fishing:client:FishesMenu', src, fishCounts)
    end
end)


RegisterNetEvent('u-fishing:server:FishingSellItemsTwo')
AddEventHandler('u-fishing:server:FishingSellItemsTwo', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local totalEarnings = 0
    
    if Player then 
        local fishItem = Config.Fishing.FishingItems[2]
        local item = Player.Functions.GetItemByName(fishItem)
        if item and item.amount > 0 then
            Player.Functions.RemoveItem(fishItem, item.amount)
            totalEarnings = totalEarnings + (Config.Fishing.FishingPrices[fishItem] * item.amount)
        end

        if totalEarnings > 0 then 
            Player.Functions.AddMoney(Config.Fishing.Money, totalEarnings, 'sold-fish')
            TriggerClientEvent('u-fishing:client:ShowFishAlertTwo', src, totalEarnings)
        else
            TriggerClientEvent('u-fishing:client:ShowFishAlertTwoError', src, totalEarnings)
        end
    end
end)

RegisterNetEvent('u-fishing:server:FishingSellItemsTre')
AddEventHandler('u-fishing:server:FishingSellItemsTre', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local totalEarnings = 0

    if Player then 
        local fishItem = Config.Fishing.FishingItems[3]
        local item = Player.Functions.GetItemByName(fishItem)
        if item and item.amount > 0 then 
            Player.Functions.RemoveItem(fishItem, item.amount)
            totalEarnings = totalEarnings + (Config.Fishing.FishingPrices[fishItem] * item.amount)
        end

        if totalEarnings > 0 then
        Player.Functions.AddMoney(Config.Fishing.Money, totalEarnings, 'sold-fish')
        TriggerClientEvent('u-fishing:client:ShowFishAlertTre', src, totalEarnings)
    else
        TriggerClientEvent('u-fishing:client:ShowFishAlertTreError', src, totalEarnings)
    end
end
end)

RegisterNetEvent('u-fishing:server:FishingRod')
AddEventHandler('u-fishing:server:FishingRod', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then 
        local FishingRoditem = Config.Fishing.FishingItems[4]
        if FishingRoditem then 
            Player.Functions.AddItem(FishingRoditem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add') 
        end

        TriggerClientEvent('u-fishing:client:ShowFishingrodNoti', src)
   end
end)

