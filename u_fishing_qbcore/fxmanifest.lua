fx_version 'cerulean'
game 'gta5' 
lua54 "yes"

author 'Uggishhh#4551'
description 'Fishing Script Made by Uggish Resources.'

shared_scripts{
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- set this to "locales/sv.lua" if you want to use Swedish translations.
    'locales/*.lua',
    '@ox_lib/init.lua'
}
client_scripts {
    'client/main.lua',
}
server_scripts {
    'server/main.lua'
}
dependencies {
    'ox_target'
}
