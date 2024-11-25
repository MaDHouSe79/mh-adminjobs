--[[ ===================================================== ]] --
--[[        MH Admin Job Changer Script by MaDHouSe        ]] --
--[[ ===================================================== ]] --
local QBCore = exports['qb-core']:GetCoreObject()

local function isAdmin(source)
    if IsPlayerAceAllowed(source, 'admin') then return true end
    if IsPlayerAceAllowed(source, 'command') then return true end
    return false
end

local function SetJob(source, job, rank)
    if isAdmin(source) then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.SetJob(job, rank)
        TriggerClientEvent('QBCore:Notify', source, Lang:t('jobInfo.job_change', {job = job, rank = rank}))
        if job == 'police' or job == 'ambulance' then
            if job == 'police' then TriggerEvent("police:server:UpdateCurrentCops") end
            TriggerEvent("police:server:UpdateBlips")
        end
        TriggerClientEvent("mh-adminjobs:client:ToggleDuty", source)
    end
end

RegisterNetEvent('mh-adminjobs:server:changeJob', function(job, rank)
    local src = source
    if isAdmin(src) then SetJob(src, job, rank) end
end)

QBCore.Functions.CreateCallback('mh-adminjobs:server:isAdmin', function(source, cb)
    local src = source
    local isAllowed = false
    if isAdmin(source) then isAllowed = true end
    cb(isAllowed)
end)