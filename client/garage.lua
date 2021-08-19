QBCore = nil
local PlayerData = {}
local pedspawned = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
    PlayerData =  QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     PlayerJob = job
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.GaragePedlocation) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(v.cords - pos)
			
			if dist < 40 and pedspawned == false then
				TriggerEvent('spawn:ped',v.cords,v.h)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(npc)
			end
		end
	end
end)

RegisterNetEvent('spawn:ped')
AddEventHandler('spawn:ped',function(coords,heading)
	local hash = GetHashKey('ig_floyd')
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawned = true
	npc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
	while not TaskPlayAnim(npc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(1000)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('qb-burgershot:garage')
AddEventHandler('qb-burgershot:garage', function(bs)
    local vehicle = bs.vehicle
    local coords = { ['x'] = -1172.861, ['y'] = -888.4072, ['z'] = 13.940833 -1, ['h'] = 40.516719 }
    
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "burgershot" then
            if vehicle == 'stalion2' then
			
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "BURGER"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.h)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else 
            QBCore.Functions.Notify('You are not an employee of BurgerShot.', 'error')
            
        end
    end)    
end)

RegisterNetEvent('qb-burgershot:storecar')
AddEventHandler('qb-burgershot:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()

    QBCore.Functions.Notify('Work Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)

RegisterNetEvent('garage:menu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "BurgerShot Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Stallion",
            txt = "Declasse Burger Shot Stallion",
            params = {
                event = "qb-burgershot:garage",
                args = {
                    vehicle = 'stalion2',
                }
            }
        },
        {
            id = 3,
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "qb-burgershot:storecar",
                args = {
                    
                }
            }
        },		
    })
end)


