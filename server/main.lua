local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-burgershot:open:murdermeal', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local randomToy = math.random(1,10)

    Player.Functions.RemoveItem("burger-murdermeal",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-murdermeal"], "remove")

    Player.Functions.AddItem("burger-heartstopper", 1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-heartstopper"], "add")
    Player.Functions.AddItem("burger-softdrink", 1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-softdrink"], "add")
    Player.Functions.AddItem("burger-fries", 1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-fries"], "add")

    if randomToy < 4 then
        Player.Functions.AddItem("burger-coupon10", 1)
        TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-coupon10"], "add")
            
    elseif randomToy == 4 then
        Player.Functions.AddItem("burger-toy1", 1)
        TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-toy1"], "add")
            
    elseif randomToy < 10 and randomToy > 4 then
       Player.Functions.AddItem("burger-coupon15", 1)
        TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-coupon15"], "add")
            
    elseif randomToy == 10 then
        Player.Functions.AddItem("burger-toy2", 1)
        TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-toy2"], "add")
            
    elseif randomToy > 10 and randomToy < 15 then
        TriggerClientEvent("QBCore:Notify", src, "No toy in Box Looool", "error")
    elseif randomToy == 15 then
        Player.Functions.AddItem("burger-coupon25", 1)
        TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-coupon25"], "add")
                        
    end  
end)

RegisterNetEvent('qb-burgershot:create:murdermeal', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-heartstopper",1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-heartstopper"], "remove")
    Player.Functions.RemoveItem("burger-softdrink",1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-softdrink"], "remove")

    Player.Functions.AddItem("burger-murdermeal", 1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-murdermeal"], "add")


end)

RegisterNetEvent('qb-burgershot:create:burgerbleeder', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-meat",1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-meat"], "remove")
    Player.Functions.RemoveItem("burger-lettuce",1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-lettuce"], "remove")
    Player.Functions.RemoveItem("burger-bun",1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-bun"], "remove")
    Player.Functions.RemoveItem("burger-tomato",1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-tomato"], "remove")
    Player.Functions.AddItem("burger-bleeder", 1)
    TriggerClientEvent("inventory:client:ItemBox", src,  QBCore.Shared.Items["burger-bleeder"], "add")
end)


RegisterNetEvent('qb-burgershot:create:burgermoneyshot', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-meat",1)
    TriggerClientEvent("inventory:client:ItemBox", src,QBCore.Shared.Items["burger-meat"], "remove")

    Player.Functions.RemoveItem("burger-lettuce",1)
    TriggerClientEvent("inventory:client:ItemBox", src,QBCore.Shared.Items["burger-lettuce"], "remove")
    
    Player.Functions.RemoveItem("burger-bun",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-bun"], "remove")
    
    Player.Functions.RemoveItem("burger-tomato",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-tomato"], "remove")
    
    Player.Functions.AddItem("burger-moneyshot", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-moneyshot"], "add")
end)

RegisterNetEvent('qb-burgershot:create:burgerheartstopper', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-meat",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-meat"], "remove")

    Player.Functions.RemoveItem("burger-lettuce",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-lettuce"], "remove")
    
    Player.Functions.RemoveItem("burger-bun",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-bun"], "remove")
    
    Player.Functions.RemoveItem("burger-tomato",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-tomato"], "remove")
    
    Player.Functions.AddItem("burger-heartstopper", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-heartstopper"], "add")
end)

RegisterNetEvent('qb-burgershot:create:torpedo', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-meat",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-meat"], "remove")

    Player.Functions.RemoveItem("burger-bun",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-bun"], "remove")
    
    Player.Functions.AddItem("burger-torpedo", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-torpedo"], "add")
end)

RegisterNetEvent('qb-burgershot:create:burgermeatfree', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-tomato",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-tomato"], "remove")

    Player.Functions.RemoveItem("burger-lettuce",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-lettuce"], "remove")
    
    Player.Functions.RemoveItem("burger-bun",1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-bun"], "remove")
    
    Player.Functions.AddItem("burger-meatfre", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-meatfre"], "add")
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientBurger', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local bun = Ply.Functions.GetItemByName("burger-bun")
    local tomato = Ply.Functions.GetItemByName("burger-tomato")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientTorpedo', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local bun = Ply.Functions.GetItemByName("burger-bun")
    if meat ~= nil and bun ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMeatfree', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bun = Ply.Functions.GetItemByName("burger-bun")
    local tomato = Ply.Functions.GetItemByName("burger-tomato")
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMurderMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local heartstopper = Ply.Functions.GetItemByName("burger-heartstopper")
    local software = Ply.Functions.GetItemByName("burger-softdrink")
    if fries ~= nil and heartstopper ~= nil and software ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateUseableItem("burger-murdermeal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:MurderMeal", source, item.name)
end)




RegisterNetEvent('qb-burgershot:remove:potato', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-potato", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-potato"], "remove")
end)

RegisterNetEvent('qb-burgershot:add:fries', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("burger-fries", 4)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-fries"], "add")
end)

RegisterNetEvent('qb-burgershot:remove:rawpatty', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-raw", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-raw"], "remove")
end)

RegisterNetEvent('qb-burgershot:add:burgermeat', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("burger-meat", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-meat"], "add")
end)

RegisterNetEvent('qb-burgershot:remove:sodasyrup', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-sodasyrup", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-sodasyrup"], "remove")
end)

RegisterNetEvent('qb-burgershot:add:softdrink', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("burger-softdrink", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-softdrink"], "add")
end)

RegisterNetEvent('qb-burgershot:remove:mshakeformula', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("burger-mshakeformula", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-mshakeformula"], "remove")
end)

RegisterNetEvent('qb-burgershot:add:mshake', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("burger-mshake", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["burger-mshake"], "add")
end)

RegisterServerEvent("qb-burgershot:bill:player")
AddEventHandler("qb-burgershot:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'burgershot' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)
