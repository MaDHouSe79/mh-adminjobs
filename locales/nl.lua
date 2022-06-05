local Translations = {

    jobInfo = {
        ["police"]     = "Geef jezelf politie als een baan", 
        ["ambulance"]  = "Geef jezelf ambulance als een baan", 
        ["mechanic"]   = "Geef jezelf mechanic als een baan", 
        ["cardealer"]  = "Geef jezelf cardealer als een baan", 
        ["realestate"] = "Geef jezelf realestate als een baan", 
        ["unemployed"] = "Maak jezelf koos werkloos", 
        ["onduty"]     = "Ga in dienst", 
        ["offduty"]    = "Ga uit dienst", 
        ["job_change"] = "Gefeliciteerd met je nieuwe baan als %{job{} met de rang %{rank} (Baas)", 
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})