RegisterCommand('save', function (source, args)

-- Locals on the player and the player's vehicle --
local playerPed = PlayerPedId() -- Gets the local player's ped ID
local playerID = PlayerId() -- Gets the player's ID
local getPlayerPed = GetPlayerPed(-1) -- get the player ped
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local vehicleClass = GetVehicleClass(playerVehicle) -- get player vehicle's class
local doesVehicleExist = DoesEntityExist(playerVehicle) -- checks if the vehicle that has the blip still exists

local blip = AddBlipForEntity(playerVehicle)

-- Saved Vehicle Blips --
if vehicleClass == 8 then
    SetBlipSprite(blip, 226)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your motorcycle is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif vehicleClass == 16 then
    SetBlipSprite(blip, 251)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your plane is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif vehicleClass == 14 then
    SetBlipSprite(blip, 427)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your boat is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif vehicleClass == 15 then
    SetBlipSprite(blip, 43)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your helicopter is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif vehicleClass == 17 then
    SetBlipSprite(blip, 198)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your vehicle is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif vehicleClass == 18 then
    SetBlipSprite(blip, 56)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your emergency vehicle is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif vehicleClass == 20 then
    SetBlipSprite(blip, 477)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your vehicle is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
else
    SetBlipSprite(blip, 225)
    SetBlipNameToPlayerName(blip, playerID)
    exports.pNotify:SendNotification({text = "Your vehicle is now saved on your map.", type = "success", timeout = (10000), layout = "bottomCenter",})
end

while doesVehicleExist == 1 do
    Citizen.Wait(5000)
    if doesVehicleExist == 0 then
        RemoveBlip(blip)
    break
    end
end

TriggerEvent("chat:addSuggestion", "/save", "Save the vehicle you are currently in.")
end)

-- Set Saved Vehicle Blip Color --
RegisterCommand('vehicleblipcolor', function(source, args)
local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local vehicleClass = GetVehicleClass(playerVehicle) -- get player vehicle's class
local getSavedBlip = GetBlipFromEntity(playerVehicle) -- get current vehicle's blip

if args[1] == "red" then
    SetBlipColour(getSavedBlip, 1)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "green" then
    SetBlipColour(getSavedBlip, 2)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "blue" then
    SetBlipColour(getSavedBlip, 3)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "white" then
    SetBlipColour(getSavedBlip, 4)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "yellow" then
    SetBlipColour(getSavedBlip, 5)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "violet" then
    SetBlipColour(getSavedBlip, 7)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "pink" then
    SetBlipColour(getSavedBlip, 8)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "orange" then
    SetBlipColour(getSavedBlip, 17)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "cyan" then
    SetBlipColour(getSavedBlip, 15)
    exports.pNotify:SendNotification({text = "You have successfully changed your vehicle's blip color.", type = "success", timeout = (10000), layout = "bottomCenter",})
else
    exports.pNotify:SendNotification({text = "You have no vehicle that you are currently in.", type = "error", timeout = (10000), layout = "bottomCenter",})
end
end)

-- Vehicle Dirt --
RegisterCommand('dirt', function(source, args)

local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local vehicleClass = GetVehicleClass(playerVehicle) -- get player vehicle's class
local msg = table.concat(args, ' ')
local vehType

if vehicleClass == 8 then
    vehType = "motorcycle"
elseif vehicleClass == 16 then
    vehType = "plane"
elseif vehicleClass == 14 then
    vehType = "boat"
elseif vehicleClass == 15 then
    vehType = "helicopter"
elseif vehicleClass == 18 then
    vehType = "emergency vehicle"
else
    vehType = "vehicle"
end

if args[1] == "max" then
    SetVehicleDirtLevel(playerVehicle, 15.0)
    exports.pNotify:SendNotification({text = "Your "..vehType.." now has the most dirt.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "half" then
    SetVehicleDirtLevel(playerVehicle, 7.5)
    exports.pNotify:SendNotification({text = "Your "..vehType.." now has the half of the maximum amount of dirt.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "none" then
    SetVehicleDirtLevel(playerVehicle, 0.0)
    exports.pNotify:SendNotification({text = "Your "..vehType.." now has no dirt.", type = "success", timeout = (10000), layout = "bottomCenter",})
end

TriggerEvent("chat:addSuggestion", "/dirt", "Set the amount of dirt on your vehicle. Usage: /dirt [None, Half, Max]")
end)

-- Vehicle Alarm --
RegisterCommand('alarm', function(source, args)

local msg = table.concat(args, ' ')
local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
    
    if args[1] == "on" then
        StartVehicleAlarm(playerVehicle)
        SetVehicleAlarmTimeLeft(playerVehicle, 15000)
    else
        exports.pNotify:SendNotification({text = "You are not in a vehicle.", type = "error", timeout = (10000), layout = "bottomCenter",})
    end

TriggerEvent("chat:addSuggestion", "/alarm", "Enable the vehicle alarm. Usage: /alarm [on]")
end)

-- Emergency Brake --
RegisterCommand('ebrake', function()

local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local isPedInVehicle = IsPedInVehicle(getPlayerPed, playerVehicle, 0)
local vehicleClass = GetVehicleClass(playerVehicle) -- get player vehicle's class

    if isPedInVehicle == 1 and vehicleClass ~= 15 or 16 then
    BringVehicleToHalt(playerVehicle, 42.0, 0.01)
    else
        exports.pNotify:SendNotification({text = "You are not in a vehicle, or your vehicle does not have an emergency brake.", type = "error", timeout = (10000), layout = "bottomCenter",})
    end

TriggerEvent("chat:addSuggestion", "/ebrake", "Enable a vehicle's emergency brake. The emergency brake cannot be disabled.")
end)

-- Code 5 Stop Door Toggle --
RegisterCommand('code5doors', function(source, args)

local msg = table.concat(args, ' ')
local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local vehicleClass = GetVehicleClass(playerVehicle) -- get player vehicle's class

    if args[1] == "open" and vehicleClass == 18 then
        SetVehicleDoorOpen(playerVehicle, 0, 0, 0)
        SetVehicleDoorOpen(playerVehicle, 1, 0, 0)
        SetVehicleDoorOpen(playerVehicle, 5, 0, 0)
    elseif args[1] == "shut" and vehicleClass == 18 then
        SetVehicleDoorShut(playerVehicle, 0, 0)
        SetVehicleDoorShut(playerVehicle, 1, 0)
        SetVehicleDoorShut(playerVehicle, 5, 0)
    else
        exports.pNotify:SendNotification({text = "You are not in an emergency vehicle, or you did not specify open or shut.", type = "error", timeout = (10000), layout = "bottomCenter",})
    end

TriggerEvent("chat:addSuggestion", "/code5doors", "Open or shut your vehicle's doors to prepare for a Code 5 Stop. Usage: /code5doors [Open, Shut]")
end)

-- Lock Doors --
RegisterCommand('lock', function(source, args)

local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local playerLastVehicle = GetVehiclePedIsIn(getPlayerPed, 1)
local isPedInVehicle = IsPedInVehicle(getPlayerPed, playerVehicle, 0)

    if isPedInVehicle == 1 then
            SetVehicleDoorsLockedForAllPlayers(playerVehicle, 1)
            exports.pNotify:SendNotification({text = "You have locked your vehicle.", type = "success", timeout = (10000), layout = "bottomCenter",})
        else
            exports.pNotify:SendNotification({text = "You need to be in a vehicle.", type = "success", timeout = (10000), layout = "bottomCenter",})
        end

TriggerEvent("chat:addSuggestion", "/lock", "Lock your vehicle's doors.")
end)

-- Unlock Doors --
RegisterCommand('unlock', function(source, args)

local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local playerLastVehicle = GetVehiclePedIsIn(getPlayerPed, 1)
local isPedInVehicle = IsPedInVehicle(getPlayerPed, playerVehicle, 0)
local vehicleDoorLockStatus = GetVehicleDoorLockStatus(playerLastVehicle)
        
    SetVehicleDoorsLockedForAllPlayers(playerLastVehicle, 0)
    exports.pNotify:SendNotification({text = "You have unlocked your vehicle.", type = "success", timeout = (10000), layout = "bottomCenter",})

TriggerEvent("chat:addSuggestion", "/unlock", "Unlock your vehicle's doors.")
end)

-- Place A Vehicle Bomb --
RegisterCommand('placecarbomb', function()

local getPlayerPed = GetPlayerPed(-1)
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
local isPedInVehicle = IsPedInVehicle(getPlayerPed, playerVehicle, 0)
    if isPedInVehicle == 1 then
        AddVehiclePhoneExplosiveDevice(playerVehicle)
        exports.pNotify:SendNotification({text = "You have placed a car bomb.", type = "success", timeout = (10000), layout = "bottomCenter",})
    else
        exports.pNotify:SendNotification({text = "You are not in a vehicle.", type = "success", timeout = (10000), layout = "bottomCenter",})
    end
end)

-- Remove A Vehicle Bomb --
RegisterCommand('removecarbomb', function()

    local getPlayerPed = GetPlayerPed(-1)
    local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
    local playerLastVehicle = GetVehiclePedIsIn(getPlayerPed, 1)
    local doesCarHaveBomb = HasVehiclePhoneExplosiveDevice(playerLastVehicle)
    local doesCurrentCarHaveBomb = HasVehiclePhoneExplosiveDevice(playerVehicle)
    local isPedInVehicle = IsPedInVehicle(getPlayerPed, playerVehicle, 0)
    
    if doesCarHaveBomb == 1 then
        ClearVehiclePhoneExplosiveDevice(playerLastVehicle)
        exports.pNotify:SendNotification({text = "Your car bomb is removed.", type = "success", timeout = (10000), layout = "bottomCenter",})
    elseif doesCurrentCarHaveBomb == 1 then
        ClearVehiclePhoneExplosiveDevice(playerVehicle)
        exports.pNotify:SendNotification({text = "Your car bomb is removed.", type = "success", timeout = (10000), layout = "bottomCenter",})
    else
        exports.pNotify:SendNotification({text = "The vehicle doesn't have a car bomb.", type = "error", timeout = (10000), layout = "bottomCenter",})
    end
end)

-- Detonate A Car Bomb --
RegisterCommand('detonatecarbomb', function()

    local getPlayerPed = GetPlayerPed(-1)
    local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle
    local playerLastVehicle = GetVehiclePedIsIn(getPlayerPed, 1)
    local doesCarHaveBomb = HasVehiclePhoneExplosiveDevice(playerLastVehicle)
    
    if doesCarHaveBomb == 1 then
        DetonateVehiclePhoneExplosiveDevice(playerLastVehicle)
        exports.pNotify:SendNotification({text = "Your car bomb has exploded.", type = "success", timeout = (10000), layout = "bottomCenter",})
    else
        exports.pNotify:SendNotification({text = "The vehicle doesn't have a car bomb.", type = "error", timeout = (10000), layout = "bottomCenter",})
    end
end)

-- Place Boat Anchor --
RegisterCommand('placeanchor', function()
    local getPlayerPed = GetPlayerPed(-1)
    local playerVehicle = GetVehiclePedIsUsing(getPlayerPed)
    local canBoatAnchor = CanAnchorBoatHere(playerVehicle)

    if canBoatAnchor == 1 then
        SetBoatAnchor(playerVehicle, 1)
        SetBoatFrozenWhenAnchored(playerVehicle, 1)
        exports.pNotify:SendNotification({text = "Your boat is now anchored.", type = "success", timeout = (10000), layout = "bottomCenter",})
    else
        exports.pNotify:SendNotification({text = "You cannot use the anchor.", type = "error", timeout = (10000), layout = "bottomCenter",})
    end
end)

-- Remove Boat Anchor --
RegisterCommand('removeanchor', function()
    local getPlayerPed = GetPlayerPed(-1)
    local playerVehicle = GetVehiclePedIsUsing(getPlayerPed)
    local isBoatAnchored = IsBoatAnchoredAndFrozen(playerVehicle)

    if isBoatAnchored == 1 then
        SetBoatAnchor(playerVehicle, 0)
        SetBoatFrozenWhenAnchored(playerVehicle, 0)
        exports.pNotify:SendNotification({text = "Your boat anchor is now removed.", type = "success", timeout = (10000), layout = "bottomCenter",})
    else
        exports.pNotify:SendNotification({text = "You cannot use the anchor.", type = "error", timeout = (10000), layout = "bottomCenter",})
    end
end)