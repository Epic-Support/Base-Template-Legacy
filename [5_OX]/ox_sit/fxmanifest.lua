
fx_version 'adamant'
game 'gta5'

name 'ox_sit'
description 'ox_sit(esx to ox conversion)'
lua54 'yes'
version '2.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

server_scripts {
	'server.lua'
}

client_scripts {
	'client.lua'
}

escrow_ignore {
	'config.lua'
}
