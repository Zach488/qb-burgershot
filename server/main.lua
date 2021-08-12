QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
---Testing Needed

RegisterServerEvent('qb-burgershot:bill:player')
AddEventHandler("qb-burgershot:bill:player", function(playerId, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "police" then
        if OtherPlayer ~= nil then
            OtherPlayer.Functions.RemoveMoney("bank", amount, "Burgershot")
            TriggerClientEvent('QBCore:Notify', OtherPlayer.PlayerData.source, "You have been billed $"..amount)
        end
    end
end)


