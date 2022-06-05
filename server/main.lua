--[[ ===================================================== ]]--
--[[      QBCore Admin Job Changer Script by MaDHouSe      ]]--
--[[ ===================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()

local function SetJob(source, job, rank)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetJob(job, rank)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('jobInfo.job_change', {job = job, rank = rank}))
    if job == 'police' then
        TriggerEvent("police:server:UpdateCurrentCops")
        TriggerEvent("police:server:UpdateBlips")
    end     
    if job == 'ambulance' then
        TriggerEvent("police:server:UpdateBlips")
    end
end

QBCore.Commands.Add('nojob', Lang:t('jobInfo.unemployed'), {}, false, function(source) SetJob(source, 'unemployed', Config.JobBossRank.unemployed) end, 'admin')
QBCore.Commands.Add('poljob', Lang:t('jobInfo.police'), {}, true, function(source) SetJob(source, 'police', Config.JobBossRank.police) end, 'admin')
QBCore.Commands.Add('ambjob', Lang:t('jobInfo.ambulance'), {}, true, function(source) SetJob(source, 'ambulance', Config.JobBossRank.ambulance) end, 'admin')
QBCore.Commands.Add('mechjob', Lang:t('jobInfo.mechanic'), {}, true, function(source) SetJob(source, 'mechanic', Config.JobBossRank.mechanic) end, 'admin')
QBCore.Commands.Add('carjob', Lang:t('jobInfo.cardealer'), {}, true, function(source) SetJob(source, 'cardealer', Config.JobBossRank.cardealer) end, 'admin')
QBCore.Commands.Add('realjob', Lang:t('jobInfo.realestate'), {}, true, function(source) SetJob(source, 'realestate', Config.JobBossRank.realestate) end, 'admin')
QBCore.Commands.Add('onduty', Lang:t('jobInfo.onduty'), {}, false, function(source) TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source) end, 'admin')
QBCore.Commands.Add('offduty', Lang:t('jobInfo.offduty'), {}, false, function(source) TriggerClientEvent("qb-adminjobs:client:ToggleDuty", source) end, 'admin')
QBCore.Functions.CreateCallback('qb-adminjobs:server:haspermission', function(source, cb)
    if QBCore.Functions.HasPermission(source, 'admin') or QBCore.Functions.HasPermission(source, 'god') or IsPlayerAceAllowed(source, 'command') then
        cb(true)
    else
        cb(false)
    end
end)
