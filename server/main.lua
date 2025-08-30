--[[ ===================================================== ]] --
--[[        MH Admin Job Changer Script by MaDHouSe        ]] --
--[[ ===================================================== ]] --
local QBCore = exports['qb-core']:GetCoreObject()

local function isAdmin(src)
    if IsPlayerAceAllowed(src, 'admin') or IsPlayerAceAllowed(src, 'command') then return true end
    return false
end

local function SetJob(src, data)
    if isAdmin(src) then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            Player.Functions.SetJob(data.job, data.rank)
            if data.job == 'police' or data.job == 'ambulance' then
                if data.job == 'police' then TriggerEvent("police:server:UpdateCurrentCops") end
                TriggerEvent("police:server:UpdateBlips")
            end
            TriggerClientEvent("mh-adminjobs:client:ToggleDuty", src)
            return true
        else
            return false
        end
    else
        return false
    end
    return false
end

QBCore.Functions.CreateCallback('mh-adminjobs:server:isAdmin', function(src, cb)
    cb(isAdmin(src))
end)

QBCore.Functions.CreateCallback('mh-adminjobs:server:changeJob', function(src, cb, data)
    if isAdmin(src) then
        cb(SetJob(src, data))
        return
    end
    cb(false)
end)
