--[[ ===================================================== ]]--
--[[        MH Admin Job Changer Script by MaDHouSe        ]]--
--[[ ===================================================== ]]--
fx_version 'cerulean'
games { 'gta5' }

author 'MaDHouSe79'
description 'MH Adminjob Changer'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    '@qb-core/shared/jobs.lua',
    'locales/en.lua', -- change en to your language
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/update.lua',
}

dependencies {
    'qb-core',
}

lua54 'yes'
