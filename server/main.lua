--[[ ===================================================== ]]--
--[[      QBCore Admin Job Changer Script by MaDHouSe      ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()

local function SetJob(source, job, rank)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob(job, rank)
    TriggerClientEvent('QBCore:Notify', src, 'Congratulations on your new job as a cardealer with rank '..rank..' (Boss)')
    if job == 'police' then
        TriggerEvent("police:server:UpdateCurrentCops")
        TriggerEvent("police:server:UpdateBlips")
    end     
    if job == 'ambulance' then
        TriggerEvent("police:server:UpdateBlips")
    end
end

QBCore.Commands.Add('poljob', "Give yourself police as a job", {}, true, function(source)
    SetJob(source, 'police', Config.JobBossRank.police)
end, 'admin')

QBCore.Commands.Add('ambjob', "Give your self ambulance as a job", {}, true, function(source)
    SetJob(source, 'ambulance', Config.JobBossRank.ambulance)
end, 'admin')

QBCore.Commands.Add('mechjob', "Give your self mechanic as job", {}, true, function(source)
    SetJob(source, 'mechanic', Config.JobBossRank.mechanic)
end, 'admin')

QBCore.Commands.Add('carjob', "Give your self cardealer as job", {}, true, function(source)
    SetJob(source, 'cardealer', Config.JobBossRank.cardealer)
end, 'admin')

QBCore.Commands.Add('realjob', "Give your self realestate as job", {}, true, function(source)
    SetJob(source, 'realestate', Config.JobBossRank.realestate)
end, 'admin')

QBCore.Commands.Add('nojob', "Make yourself unemployed", {}, false, function(source)
    SetJob(source, 'unemployed', Config.JobBossRank.unemployed)
end, 'admin')

QBCore.Commands.Add('onduty', "Put yourself in service", {}, false, function(source)
    TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source)
end, 'admin')

QBCore.Commands.Add('offduty', "Take you out of service", {}, false, function(source)
    TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source)
end, 'admin')

QBCore.Functions.CreateCallback('qb-adminjobs:server:haspermission', function(source, cb)
    if QBCore.Functions.HasPermission(source, 'admin') or QBCore.Functions.HasPermission(source, 'god') or IsPlayerAceAllowed(source, 'command') then
        cb(true)
    else
        cb(false)
    end
end)
