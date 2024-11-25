--[[ ===================================================== ]] --
--[[        MH Admin Job Changer Script by MaDHouSe        ]] --
--[[ ===================================================== ]] --
local QBCore = exports['qb-core']:GetCoreObject()
local radialmenu = nil

RegisterNetEvent('qb-radialmenu:client:onRadialmenuOpen', function()
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
            local AdminMenu = {
                id = 'admininteractions' .. num,
                title = 'Admin',
                icon = 'briefcase',
                items = {MenuItems}
            }
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
end)

local function LoadTriggerEvents()
    for job, v in pairs(QBShared.Jobs) do
        if job == "unemployed" then
            RegisterNetEvent('mh-adminjobs:client:' .. job, function(source)
                TriggerServerEvent('mh-adminjobs:server:changeJob', job, 0)
            end)
        end
        for grade, d in pairs(v.grades) do
            if d.isboss then
                RegisterNetEvent('mh-adminjobs:client:' .. job, function(source)
                    TriggerServerEvent('mh-adminjobs:server:changeJob', job, grade)
                end)
            end
        end
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        LoadTriggerEvents()
    end
end)

AddEventHandler('playerSpawned', function()
    LoadTriggerEvents()
end)

RegisterNetEvent('mh-adminjobs:client:ToggleDuty', function(source)
    TriggerServerEvent("QBCore:ToggleDuty")
end)