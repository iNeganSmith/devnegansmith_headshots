fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'devnegansmith_headshots'
author 'DevNeganSmith'
description 'Headshots letales configurables. Standalone, compatible con ESX Legacy, QBCore y Qbox/QBX.'
version '1.0.2'

shared_script 'config.lua'
client_script 'client.lua'

-- Mantiene la configuración editable cuando el recurso se distribuye mediante FiveM Asset Escrow.
escrow_ignore {
    'config.lua'
}
