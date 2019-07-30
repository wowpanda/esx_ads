ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Taxi ad
RegisterServerEvent('global:taxiad')
AddEventHandler('global:taxiad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Downtown Cab Co', 'Reklaam', table.concat(args, " "), 'CHAR_TAXI', 1)
	end
end)

-- Mechanic ad
RegisterServerEvent('global:mechanicad')
AddEventHandler('global:mechanicad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Los Santos Customs', 'Reklaam', table.concat(args, " "), 'CHAR_LS_CUSTOMS', 1)
	end
end)

-- Global ad
RegisterServerEvent('global:globalad')
AddEventHandler('global:globalad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Lifeinvader', 'Reklaam', table.concat(args, " "), 'CHAR_LIFEINVADER', 1)
	end
end)

-- Darkweb ad
RegisterServerEvent('global:darkwebad')
AddEventHandler('global:darkwebad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'DARKWEB', 'Reklaam', table.concat(args, " "), 'CHAR_LESTER_DEATHWISH', 1)
	end
end)

-- Remove money
RegisterNetEvent("advert:removemoney")
AddEventHandler("advert:removemoney", function(index)
    local amount = 200
    local playerMoney = getMoney(source)
    if playerMoney >= amount then
        removeMoney(source, amount)
    else
       	exports['mythic_notify']:DoHudText('error', 'Sul ei ole reklaami jaoks raha.')
    end
end)

-- Helper functions
function getMoney(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local getmoney = xPlayer.getMoney()
    return getmoney
end

function removeMoney(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(amount)
end