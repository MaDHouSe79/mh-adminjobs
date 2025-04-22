--[[ ===================================================== ]]--
--[[        MH Admin Job Changer Script by MaDHouSe        ]]--
--[[ ===================================================== ]]--
local Translations = {
    jobInfo = {
        ["job_change"] = "Gefeliciteerd met je nieuwe baan als %{job} met de rang %{rank}", 
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
