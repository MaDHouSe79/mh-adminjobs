local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-adminjobs:client:ToggleDuty', function(source)
    TriggerServerEvent("QBCore:ToggleDuty")
end)