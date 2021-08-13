fx_version 'cerulean'
game 'gta5'

description 'qb-burgershot'
version '1.1'

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'config.lua',
	'client/main.lua',
}

server_scripts {
    'server/main.lua',
	'config.lua',
}

