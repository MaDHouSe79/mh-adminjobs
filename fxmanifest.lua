fx_version 'cerulean'
games { 'gta5' }

author 'MaDHouSe'
description 'QB Adminjob Changer'
version '1.0'

client_scripts {
    'config.lua',
    'client/main.lua',
}

server_scripts {
    'config.lua',
    'server/main.lua',
}

dependencies {
    'qb-core',
}

lua54 'yes'