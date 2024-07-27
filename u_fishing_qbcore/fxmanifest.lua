fx_version 'cerulean'
game 'gta5' 
lua54 "yes"

author 'Uggishhh#4551'
description 'Fishing Script Made by Uggish Resources.'

shared_scripts{
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    '@ox_lib/init.lua'
}
client_scripts {
    'client/main.lua',
}
server_scripts {
    'server/main.lua'
}
escrow_ignore {
    'config.lua',
    'locales/en.lua'
}

dependencies {
    'ox_target'
}
