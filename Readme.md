# Currently Outdated as i need to test the new functionality and change qb-target functions in the client side . Updated to come in the following weeks

# A Burgershot for QBCore Framework

Preview : https://www.youtube.com/watch?v=9sLa6d6hUXY&t=42s

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 19/08/2021.

- No support will be given to people using scripts created outside of the QBCore Framework meaning external scripts such as aj-inventory.


## Dependencies :

QB Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

nh-context - ~~https://github.com/nerohiro/nh-context (owner removed script)~~

nh-keyboard - ~~https://github.com/nerohiro/nh-keyboard (owner removed script)~~


## Credits : 

Decisive Burgershot Job  - https://github.com/decisiveE/BurgerShotJob-for-qb/tree/main/decisive-job


## Soon To Come
- Random Toys in the murder meal box. 
- Lucky tickets that gives a player certain amount of money or rewward. 

## Insert into #qb-smallresources --> server --> consumables.lua
```
--Burgershot

--Drinks
QBCore.Functions.CreateUseableItem("burger-softdrink", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-mshake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

--Food
QBCore.Functions.CreateUseableItem("burger-bleeder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-moneyshot", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-torpedo", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-heartstopper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-meatfree", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("burger-fries", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
```



## Insert into #qb-smallresources --> config.lua
```
Consumeables = {

--Food 

["burger-bleeder"] = math.random(35, 54),
["burger-moneyshot"] = math.random(35, 54),
["burger-torpedo"] = math.random(35, 54),
["burger-heartstopper"] = math.random(35, 54),
["burger-meatfree"] = math.random(35, 54),
["burger-fries"] = math.random(35, 54),


--Drinks
["burger-softdrink"] = math.random(40, 50),
["burger-mshake"] = math.random(40, 50),

} 
```

## Insert into #qb-core - Shared.lua

```
QBShared.Items = {
-- Burger Shot
-- Food
	["burger-bleeder"] 				 = {["name"] = "burger-bleeder", 			 	["label"] = "Bleeder", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "bs_the-bleeder.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-moneyshot"] 			 = {["name"] = "burger-moneyshot", 			 	["label"] = "Moneyshot", 				["weight"] = 300, 		["type"] = "item", 		["image"] = "bs_money-shot.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-torpedo"] 				 = {["name"] = "burger-torpedo", 			 	["label"] = "Torpedo", 					["weight"] = 310, 		["type"] = "item", 		["image"] = "bs_torpedo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-heartstopper"] 		 = {["name"] = "burger-heartstopper", 			["label"] = "Heartstopper", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "bs_the-heart-stopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-meatfree"] 		 	 = {["name"] = "burger-meatfree", 				["label"] = "MeatFree", 			["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_meat-free.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["burger-fries"] 				 = {["name"] = "burger-fries", 			 	  	["label"] = "Fries", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_fries.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
		-- Drinks
	
	["burger-softdrink"] 			 = {["name"] = "burger-softdrink", 				["label"] = "Soft Drink", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ice Cold Drink."},
	["burger-mshake"] 			     = {["name"] = "burger-mshake", 				["label"] = "Milkshake", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_milkshake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hand-scooped for you!"},
	
--Ingredients
	["burger-bun"] 				 	 = {["name"] = "burger-bun", 			 	  	["label"] = "Bun", 			["weight"] = 125, 		["type"] = "item", 					["image"] = "bs_bun.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-meat"] 				 = {["name"] = "burger-meat", 			 	  	["label"] = "Cooked Patty", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-lettuce"] 				 = {["name"] = "burger-lettuce", 			 	["label"] = "Lettuce", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_lettuce.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-tomato"] 				 = {["name"] = "burger-tomato", 			 	["label"] = "Tomato", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_tomato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-raw"] 				 	 = {["name"] = "burger-raw", 			 		["label"] = "Raw Patty", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty_raw.png", 	        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-potato"] 				 = {["name"] = "burger-potato", 			 	["label"] = "Bag of Potatoes", 		["weight"] = 1500, 		["type"] = "item", 			["image"] = "bs_potato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-mshakeformula"] 		 = {["name"] = "burger-mshakeformula", 			["label"] = "Milkshake Formula", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_ingredients_icecream.png", ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-sodasyrup"] 		 	 = {["name"] = "burger-sodasyrup", 				["label"] = "Soda Syrup", 		["weight"] = 125, 		["type"] = "item", 				["image"] = "bs_ingredients_hfcs.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
}

["burger-murdermeal"] 		 	 = {["name"] = "burger-murdermeal", 				["label"] = "Murder Meal", 		["weight"] = 125, 		["type"] = "item", 				["image"] = "stilltocome.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Amazing Murder Meal with a chance of a toy."},
}

```

```
QBShared.Jobs = {
    ["burgershot"] = {
		label = "Burgershot Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 50
            },
			['1'] = {
                name = "Employee",
                payment = 75
            },
			['2'] = {
                name = "Burger Flipper",
                payment = 100
            },
			['3'] = {
                name = "Manager",
                payment = 125
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 150
            },
        },
	},
}		
```



## Insert into #qb-bossmenu - config.lua
```
['burgershot'] = vector3(-1192.04, -902.476, 13.998)),
```

## Insert into #qb-target - config.lua - config.targetmodels
```
["burgershotgarage"] = {
			models = {
				"ig_floyd"
			},
			options = {
				{
					type = "client",
					event = "garage:BurgerShotGarage",
					icon = "fas fa-car",
					label = "BurgerShot Garage",
					job = "burgershot",
				},
			},
			distance = 2.5,
		},

```
