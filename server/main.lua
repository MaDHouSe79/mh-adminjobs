--[[ ===================================================== ]]--
--[[      QBCore Admin Job Changer Script by MaDHouSe      ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add(Config.JobCommands.onduty, "Put yourself in service", {}, false, function(source)
    TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source)
end, 'admin')

QBCore.Commands.Add(Config.JobCommands.offduty, "Take you out of service", {}, false, function(source)
    TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source)
end, 'admin')

QBCore.Commands.Add(Config.JobCommands.police, "Give yourself police as a job", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('police', Config.JobBossRank.police)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your new job as a police officer with rank '..Config.JobBossRank.police..' (Boss)')
    TriggerEvent("police:server:UpdateCurrentCops")
    TriggerEvent("police:server:UpdateBlips")
end, 'admin')

QBCore.Commands.Add(Config.JobCommands.ambulance, "Give your self ambulance as a job", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('ambulance', Config.JobBossRank.ambulance)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your new job as an ambulance with rank '..Config.JobBossRank.ambulance..' (Boss)')
    TriggerEvent("police:server:UpdateBlips")
end, 'admin')

QBCore.Commands.Add(Config.JobCommands.mechanic, "Give your self mechanic as job", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('mechanic', Config.JobBossRank.mechanic)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your new job as a mechanic with rank '..Config.JobBossRank.mechanic..' (Boss)')
end, 'admin')

QBCore.Commands.Add(Config.JobCommands.cardealer, "Give your self cardealer as job", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('cardealer', Config.JobBossRank.cardealer)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your new job as a cardealer with rank '..Config.JobBossRank.cardealer..' (Boss)')
end, 'admin')

QBCore.Commands.Add(Config.JobCommands.realestate, "Give your self realestate as job", {}, true, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('realestate', Config.JobBossRank.realestate)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your new job as a realestate with rank '..Config.JobBossRank.realestate..' (Boss)')
end, 'admin')

QBCore.Commands.Add(Config.JobCommands.unemployed, "Make yourself unemployed", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob('unemployed', Config.JobBossRank.unemployed)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations you are now unemployed')
end, 'admin')

QBCore.Functions.CreateCallback('qb-adminjobs:server:haspermission', function(source, cb)
    if QBCore.Functions.HasPermission(source, 'admin') or QBCore.Functions.HasPermission(source, 'god') or IsPlayerAceAllowed(source, 'command') then
        cb(true)
    else
        cb(false)
    end
end)
