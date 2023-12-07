local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('playtime', function(source, args)
    if args[1] then
        local src = tonumber(args[1])
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if xPlayer.PlayerData.metadata.playtime then
            local playtime = xPlayer.PlayerData.metadata.playtime
    
            local days = math.floor(playtime / 1440)
            playtime = playtime - days * 1440
            local hours = math.floor(playtime / 60 )
            playtime = playtime - hours * 60
            local minutes = math.floor(playtime)
    
            local totalplaytime = string.format("%d zile, %d ore, %d minute.",days,hours,minutes)
            TriggerClientEvent('QBCore:Notify', source, 'Playerul cu ID-ul ' .. xPlayer.PlayerData.citizenid .. ' este in oras de ' .. totalplaytime, 'success')
        end
    end
end)