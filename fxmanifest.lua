fx_version 'cerulean'
games { 'gta5' }

author 'MaDHouSe'
description 'QB Adminjob Changer'
version '1.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- change en to your language
    'config.lua',
}

client_scripts {
    'client/main.lua',
}
server_scripts {
    'server/main.lua',
}

dependencies {
    'qb-core',
}

lua54 'yes'
