--[[ ===================================================== ]]--
--[[        MH Admin Job Changer Script by MaDHouSe        ]]--
--[[ ===================================================== ]]--
local Translations = {
    jobInfo = {
        ["job_change"] = "Congratulations on your new job as a %{job} with rank %{rank} (Boss)", 
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})