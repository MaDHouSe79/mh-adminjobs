--[[ ===================================================== ]]--
--[[      QBCore Admin Job Changer Script by MaDHouSe      ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-adminjobs:server:haspermission', function(source, cb)
    if QBCore.Functions.HasPermission(source, 'admin') or QBCore.Functions.HasPermission(source, 'god') or IsPlayerAceAllowed(source, 'command') then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Commands.Add('onduty', "Zet je in dienst", {}, false, function(source)
    TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source)
end, 'admin')

QBCore.Commands.Add('offduty', "Zet je uit dienst", {}, false, function(source)
    TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source)
end, 'admin')

QBCore.Commands.Add('poljob', "Geef je zelf police als baan", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('police', 5)
    TriggerClientEvent('QBCore:Notify', src, 'Gefeliciteerd met je nieuwe baan als politie met als rank 5 (Boss)')
    TriggerEvent("police:server:UpdateCurrentCops")
    TriggerEvent("police:server:UpdateBlips")
end, 'admin')

QBCore.Commands.Add('ambjob', "Geef je zelf ambulance als baan", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('mechanic', 5)
    TriggerClientEvent('QBCore:Notify', src, 'Gefeliciteerd met je nieuwe baan als ambulance met als rank 5 (Boss)')
    TriggerEvent("police:server:UpdateBlips")
end, 'admin')

QBCore.Commands.Add('mechjob', "Geef je zelf mechanic als baan", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('mechanic', 4)
    TriggerClientEvent('QBCore:Notify', src, 'Gefeliciteerd met je nieuwe baan als mechanic met als rank 4 (Boss)')
end, 'admin')

QBCore.Commands.Add('devjob', "Geef je zelf developer als baan", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('developer', 0)
    TriggerClientEvent('QBCore:Notify', src, 'Gefeliciteerd met je nieuwe baan als developer met als rank 4 (Boss)')
end, 'admin')

QBCore.Commands.Add('werkloos', "Maak je zelf koos werkloos", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('unemployed', 0)
    TriggerClientEvent('QBCore:Notify', src, 'Gefeliciteerd je bent nu koos werkloos')
end, 'admin')
