QBCore = nil

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

isLoggedIn = true
PlayerJob = {}

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "burgershot" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("qb-burgershot:Torpedo")
AddEventHandler("qb-burgershot:Torpedo", function()

    item1 = false 
    item2 = false 

    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem1)
        if not HasItem1 then
            QBCore.Functions.Notify("You don't have any buns..", "error")
        else
            item1 = true
        end
      end, 'burger-bun')

      Citizen.Wait(100)

      QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem2)
        if not HasItem2 then
            QBCore.Functions.Notify("You don't have any cooked meat..", "error")
        else
            item2 = true          
        end
      end, 'burger-meat')

      Citizen.Wait(100)

      if (item1 and item2) == true then
        MakeTorpedo()
      else
        print("erroorr")
      end    
end)



RegisterNetEvent("qb-burgershot:SoftDrink")
AddEventHandler("qb-burgershot:SoftDrink", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeSoftDrink()
        else
            QBCore.Functions.Notify("You don't have any soda syrup..", "error")
        end
      end, 'burger-sodasyrup')
end)

RegisterNetEvent("qb-burgershot:mShake")
AddEventHandler("qb-burgershot:mShake", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeMShake()
        else
            QBCore.Functions.Notify("You don't have any Milkshake Formula..", "error")
        end
      end, 'burger-mshakeformula')
end)

RegisterNetEvent("qb-burgershot:Fries")
AddEventHandler("qb-burgershot:Fries", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeFries()
        else
            QBCore.Functions.Notify("You don't have any potatoes..", "error")
        end
      end, 'burger-potato' )
end)


RegisterNetEvent("qb-burgershot:PattyFry")
AddEventHandler("qb-burgershot:PattyFry", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakePatty()
        else
            QBCore.Functions.Notify("You don't have any raw patties..", "error")
        end
      end, 'burger-raw')
end)



RegisterNetEvent("qb-burgershot:DutyB")
AddEventHandler("qb-burgershot:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-burgershot:Tray1")
AddEventHandler("qb-burgershot:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgertray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-burgershot:Tray4")
AddEventHandler("qb-burgershot:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgertray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-burgershot:Tray3")
AddEventHandler("qb-burgershot:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgertray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-burgershot:Storage")
AddEventHandler("qb-burgershot:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-burgershot:Storage2")
AddEventHandler("qb-burgershot:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

-- Functions --
function MakeFries()
TriggerServerEvent('QBCore:Server:RemoveItem', "burger-potato", 1)
QBCore.Functions.Progressbar("pickup", "Frying the fries..", 20000, false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = false,
})
Citizen.Wait(20000)
TriggerServerEvent('QBCore:Server:AddItem', "burger-fries", 4)
end


function MakePatty()
    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-raw", 1)
    QBCore.Functions.Progressbar("pickup", "Cooking the Patty..", 20000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(20000)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-meat", 1)
    end

function MakeSoftDrink()

    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-sodasyrup", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 20000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(20000)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-softdrink", 1)
    end  


function MakeMShake()

    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-mshakeformula", 1)
    QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 20000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(20000)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-mshake", 1)
    end  

function MakeTorpedo()

    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
    QBCore.Functions.Progressbar("pickup", "Making a torpedo..", 20000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(20000)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-torpedo", 1)
    end      
    

-- bt target -

Citizen.CreateThread(function()
    

    exports['qtarget']:AddBoxZone("Duty", vector3(-1196.95, -902.69, 14.0), 1, 1.2, {
        name = "Duty",
        heading = 32,
        debugPoly = false,
        minZ=14.0,
        maxZ=18.0,
    }, {
        options = {
            {  
                event = "qb-burgershot:DutyB",
                icon = "far fa-clipboard",
                label = "Clock On/Off",
                job = "burgershot",
            },
        },
        distance = 1.5
    })

    exports['qtarget']:AddBoxZone("burger_tray_1", vector3(-1195.29, -892.31, 14.0), 1.05, 1.0, {
        name = "burger_tray_1",
        heading = 35.0,
        debugPoly = false,
        minZ=13.8,
        maxZ=14.3,
    }, {
        options = {
            {
                event = "qb-burgershot:Tray1",
                icon = "far fa-clipboard",
                label = "Tray 1",
				job = "all",
            },
        },
        distance = 1.5
    })

    exports['qtarget']:AddBoxZone("burger_tray_2", vector3(-1193.87, -894.38, 14.0), 0.5, 0.7, {
        name="burger_tray_2",
        heading=318,
        debugPoly=false,
        minZ=14.0,
        maxZ=14.4,
    }, {
        options = {
            {
                event = "qb-burgershot:Tray4",
                icon = "far fa-clipboard",
                label = "Tray 2",
				job = "all",
            },
        },
        distance = 1.5
    })
    exports['qtarget']:AddBoxZone("burger_tray_3", vector3(-1193.88, -906.98, 14.0), 1, 1, {
        name="burger_tray_3",
        heading=350,
        debugPoly=false,
        minZ=13.2,
        maxZ=14.2,
    }, {
        options = {
            {
                event = "qb-burgershot:Tray3",
                icon = "far fa-clipboard",
                label = "Tray 3",
				job = "all",
            },
        },
        distance = 3.5
    })


 exports['qtarget']:AddBoxZone("burgershotcooker", vector3(-1200.54, -900.92, 14.0), 1.8, 1.0, {
    name="burgershotcooker",
    heading=34,
    debugPoly=false,
    minZ=13.0,
    maxZ=14.4,
    }, {
        options = {
            {
                event = "qb-burgershot:PattyFry",
                icon = "fas fa-hamburger",
                label = "Burger Cook Station",
                job = "burgershot",
            },
        },
        distance = 1.5
    })

    exports['qtarget']:AddBoxZone("burgershotcooker2 ", vector3(-1202.94, -897.38, 14.0), 1.7, 1, {
        name="burgershotcooker2 ",
        heading=34,
        debugPoly=false,
        minZ=13.0,
        maxZ=14.3,
        }, {
            options = {
                {
                    event = "qb-burgershot:PattyFry",
                    icon = "fas fa-hamburger",
                    label = "Burger Cook Station 2",
                    job = "burgershot",
                },
            },
            distance = 1.5
        })
    



    exports['qtarget']:AddBoxZone("burgershotfryer", vector3(-1202.01, -899.27, 14.0), 2.5, 1.5, {
        name="burgershotfryer",
        heading=35,
        debugPoly=false,
        minZ=13.0,
        maxZ=14.4,
        }, {
            options = {
                {
                    event = "qb-burgershot:Fries",
                    icon = "fas fa-box",
                    label = "Make Fries",
                    job = "burgershot",
                },
            },
            distance = 1.5
        })


        exports['qtarget']:AddBoxZone("burgershotdrinks", vector3(-1199.54, -895.52, 14.0), 2.2, 0.6, {
            name="burgershotdrinks",
            heading=34,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.8,
            }, {
                options = {
                    {
                        event = "nh-context:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

        exports['qtarget']:AddBoxZone("burgershotdrinks2", vector3(-1189.08, -905.28, 14.0), 1.15, 0.7, {
            name="burgershotdrinks2",
            heading=33,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.8,
            }, {
                options = {
                    {
                        event = "nh-context:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


         exports['qtarget']:AddBoxZone("burgerfridge", vector3(-1203.71, -895.86, 14.0), 1.6, 1, {
            name="burgerfridge",
            heading=35,
            debugPoly=false,
            minZ=13.0,
            maxZ=15.6,
        }, {
                options = {
                    {
                        event = "nh-context:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

        exports['qtarget']:AddBoxZone("burgershotdisplay", vector3(-1197.78, -894.45, 14.0), 4.6, 1.2, {
            name="burgershotdisplay",
            heading=34,
            debugPoly=false,
            minZ=13.0,
            maxZ=14.8,
        }, {
                options = {
                    {
                        event = "qb-burgershot:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


        exports['qtarget']:AddBoxZone("craftburger", vector3(-1197.57, -899.41, 14.0), 1.8, 0.7, {
            name="craftburger",
            heading=304,
            debugPoly=false,
            minZ=13.0,
            maxZ=14.4,
        }, {
                options = {
                    {
                        event = "nh-context:Burgers",
                        icon = "fas fa-cheeseburger",
                        label = "Burger Work Station",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


        exports['qtarget']:AddBoxZone("BurgerShot_register_1", vector3(-1196.01, -891.34, 14.0), 0.5, 0.4, {
            name="BurgerShot_register_1",
            debugPoly=false,
            heading=125,
            minZ=14.0,
            maxZ=14.5,
        }, {
                options = {
                    {
                        event = "qb-burgershot:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

        exports['qtarget']:AddBoxZone("BurgerShot_register_2", vector3(-1194.65, -893.3, 14.0), 0.6, 0.5, {
            name="BurgerShot_register_2",
            debugPoly=false,
            heading=302,
            minZ=14.1,
            maxZ=14.5,
            }, {
                    options = {
                        {
                            event = "qb-burgershot:bill",
                            parms = "2",
                            icon = "fas fa-credit-card",
                            label = "Charge Customer",
                            job = "burgershot",
                        },
                    },
                    distance = 1.5
                })  


        exports['qtarget']:AddBoxZone("BurgerShot_register_3", vector3(-1193.39, -895.22, 14.0), 0.6, 0.4, {
            name="BurgerShot_register_3",
            debugPoly=false,
            heading=125,
            minZ=14.0,
            maxZ=14.4,
                    }, {
                            options = {
                                {
                                    event = "qb-burgershot:bill",
                                    parms = "3",
                                    icon = "fas fa-credit-card",
                                    label = "Charge Customer",
                                    job = "burgershot",
                                },
                            },
                            distance = 1.5
                        })  




        exports['qtarget']:AddBoxZone("BurgerShot_register_4", vector3(-1192.52, -906.65, 14.0), 0.5, 0.5, {
            name="BurgerShot_register_4",
            heading=0,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.2,
                }, {
                        options = {
                            {
                                event = "qb-burgershot:bill",
                                parms = "4",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "burgershot",
                            },
                        },
                        distance = 1.5
            })
end)


-- NH - Context --

RegisterNetEvent('nh-context:Burgers', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Moneyshot Burger",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 2,
            header = "Meat Free Burger",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 3,
            header = "Bleeder Burger",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 4,
            header = "The Heart Stopper",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 5,
            header = "Torpedo Roll",
            txt = "",
            params = {
                event = "qb-burgershot:Torpedo"
            }
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {

        {
            id = 1,
            header = "Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-burgershot:shop"
            }
        },
        {
            id = 2,
            header = "Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-burgershot:Storage2"
            }
        },
    })
end)

RegisterNetEvent('nh-context:DrinkMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {

        {
            id = 1,
            header = "Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "qb-burgershot:SoftDrink"
            }
        },
        {
            id = 2,
            header = "Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "qb-burgershot:mShake"
            }
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-burgershot:bill")
AddEventHandler("qb-burgershot:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then 
            return 
        end
        TriggerServerEvent("qb-burgershot:bill:player", bill[1].input, bill[2].input)
    end
end)



RegisterNetEvent("qb-burgershot:shop")
AddEventHandler("qb-burgershot:shop", function()


    TriggerServerEvent("inventory:server:OpenInventory", "shop", "hospital", Config.Items)


end)



-- RegisterCommand('bill', function(source)
-- 	local job = exports["isPed"]:isPed("myjob")
-- 	if job == 'BurgerShot' then
-- 		TriggerEvent('qb-burgershot:bill')
-- 	end
-- end)



