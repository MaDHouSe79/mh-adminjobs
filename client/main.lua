--[[ ===================================================== ]] --
--[[        MH Admin Job Changer Script by MaDHouSe        ]] --
--[[ ===================================================== ]] --
local QBCore = exports['qb-core']:GetCoreObject()
local radialmenu = nil

local function Notify(message, type, length)
    lib.notify({title = "MH Admin Job Changer", description = message,  type = type})
end

local function OpenMainManu()
    QBCore.Functions.TriggerCallback("mh-adminjobs:server:isAdmin", function(isAdmin)
        if isAdmin then
            local num = 0
            local MenuItems = {
                id = 'citizen-' .. num,
                title = 'Whitelisted Banen',
                icon = 'address-book',
                items = {{
                    id = "unemployed-" .. num,
                    title = "unemployed",
                    icon = 'plus',
                    type = 'client',
                    event = 'mh-adminjobs:client:unemployed',
                    shouldClose = true
                }}
            }
            for job, v in pairs(QBShared.Jobs) do
                num = num + 1
                for grade, d in pairs(v.grades) do
                    if d.isboss then
                        MenuItems.items[#MenuItems.items + 1] = {
                            id = job .. "-" .. num,
                            title = job,
                            icon = 'plus',
                            type = 'client',
                            event = 'mh-adminjobs:client:' .. job,
                            shouldClose = true
                        }
                    end
                end
            end
            num = num + 1
            local AdminMenu = {id = 'admininteractions' .. num, title = 'Admin Jobs', icon = 'briefcase', items = {MenuItems}}
            if #AdminMenu.items == 0 then
                if radialmenu then
                    exports['qb-radialmenu']:RemoveOption(radialmenu)
                    radialmenu = nil
                end
            else
                radialmenu = exports['qb-radialmenu']:AddOption(AdminMenu, radialmenu)
            end
        end
    end)
end

local function SelectRankMenu(job)
    QBCore.Functions.TriggerCallback("mh-adminjobs:server:isAdmin", function(isAdmin)
        if isAdmin then
            local options = {}
            for k, v in pairs(QBShared.Jobs) do
                if k == job then
                    for grade, data in pairs(v.grades) do
                        local isBossTxt = ""
                        if data.isboss then isBossTxt = "(Boss)" end
                        options[#options + 1] = {
                            id = grade,
                            title = "Rank ".. grade.." ("..data.name..") "..isBossTxt.."",
                            description = v.name,
                            arrow = false,
                            onSelect = function()
                                QBCore.Functions.TriggerCallback("mh-adminjobs:server:changeJob", function(isChanged)
                                    if isChanged then Notify(Lang:t('jobInfo.job_change', {job = job, rank = grade})) end
                                end, {job = job, rank = grade})
                            end
                        }
                    end
                end
            end
            table.sort(options, function(a, b) return a.id < b.id end)
            options[#options + 1] = {
                title = "Back",
                description = '',
                arrow = false,
                onSelect = function()
                    OpenMainManu()
                end
            }

            lib.registerContext({id = 'selectTrailerMenu', title = "Select job rank", options = options})
            lib.showContext('selectTrailerMenu')
        end
    end)
end

local function LoadTriggerEvents()
    for job, v in pairs(QBShared.Jobs) do
        if job == "unemployed" then
            RegisterNetEvent('mh-adminjobs:client:' .. job, function()
                QBCore.Functions.TriggerCallback("mh-adminjobs:server:changeJob", function(isChanged)
                    if isChanged then Notify(Lang:t('jobInfo.job_change', {job = job, rank = 0})) end
                end, {job = job, rank = 0})
            end)
        else
            RegisterNetEvent('mh-adminjobs:client:' .. job, function()
                SelectRankMenu(job)
            end)
        end
    end
end

RegisterNetEvent('qb-radialmenu:client:onRadialmenuOpen', function()
    OpenMainManu()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        LoadTriggerEvents()
    end
end)

AddEventHandler('playerSpawned', function()
    LoadTriggerEvents()
end)

RegisterNetEvent('mh-adminjobs:client:ToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)
