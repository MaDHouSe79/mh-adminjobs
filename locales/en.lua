local Translations = {

    jobInfo = {
        ["police"]     = "Give yourself police as a job", 
        ["ambulance"]  = "Give your self ambulance as a job", 
        ["mechanic"]   = "Give your self mechanic as job", 
        ["cardealer"]  = "Give your self cardealer as job", 
        ["realestate"] = "Give your self realestate as job", 
        ["unemployed"] = "Make yourself unemployed", 
        ["onduty"]     = "Put yourself in service", 
        ["offduty"]    = "Take you out of service", 
        ["job_change"] = "Congratulations on your new job as a %{job} with rank %{rank} (Boss)", 
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
