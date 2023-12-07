# tatutzu-playtime
![tatutzu](https://media.capital.ro/wp-content/uploads/2023/04/George-Mihaita-1024x683.jpg)
## Step 1
### Edit the file: resources\[qb]\qb-core\server\player.lua
After the line 89 add the following:
```
PlayerData.metadata['playtime'] = PlayerData.metadata['playtime'] or 0
```

## Step 2
### Edit the file: resources\[qb]\qb-core\server\events.lua
Replace the QBCore:UpdatePlayer NetEvent founded near the line 153 with the following:
```
RegisterNetEvent('QBCore:UpdatePlayer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local newHunger = Player.PlayerData.metadata['hunger'] - QBCore.Config.Player.HungerRate
    local newThirst = Player.PlayerData.metadata['thirst'] - QBCore.Config.Player.ThirstRate
    local currentPlaytime = tonumber(Player.PlayerData.metadata['playtime'])
    Player.PlayerData.metadata['playtime'] = currentPlaytime + 5
    if newHunger <= 0 then
        newHunger = 0
    end
    if newThirst <= 0 then
        newThirst = 0
    end
    Player.Functions.SetMetaData('thirst', newThirst)
    Player.Functions.SetMetaData('hunger', newHunger)
    TriggerClientEvent('hud:client:UpdateNeeds', src, newHunger, newThirst)
    Player.Functions.Save()
end)
```

## Step 3
### Edit the file: resources\[inventory]\qs-inventory\client\modules\suggestion.lua
Add the following at the end of the file:
```
TriggerEvent('chat:addSuggestion', '/playtime', 'Command to notify the admin how much time the player has spent in the game', {
    { name = 'id', help = 'Player ID' }
})
```

## Step 4
### git clone the repository or download zip the files and after that place it to the resources folder and add the following to the server.cfg:
```
ensure tatutzu-playtime
```
