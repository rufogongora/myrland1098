-- arena script
InitArenaScript = 0
arena_room_max_time = 240 -- time in seconds for one arena room
arenaKickPosition = {x=627, y=221, z=7} -- position where kick from arena when you leave/you did arena level
arenaDidPosition = {x=627, y=207, z=6}
arena_monsters = {}
arena_monsters[42300] = 'frostfur' -- first monster from 1 arena
arena_monsters[42301] = 'bloodpaw'
arena_monsters[42302] = 'bovinus'
arena_monsters[42303] = 'achad'
arena_monsters[42304] = 'colerian the barbarian'
arena_monsters[42305] = 'the hairy one'
arena_monsters[42306] = 'axeitus headbanger'
arena_monsters[42307] = 'rocky'
arena_monsters[42308] = 'cursed gladiator'
arena_monsters[42309] = 'orcus the cruel'
arena_monsters[42310] = 'avalanche' -- first monster from 2 arena
arena_monsters[42311] = 'kreebosh the exile'
arena_monsters[42312] = 'the dark dancer'
arena_monsters[42313] = 'the hag'
arena_monsters[42314] = 'slim'
arena_monsters[42315] = 'grimgor guteater'
arena_monsters[42316] = 'drasilla'
arena_monsters[42317] = 'spirit of earth'
arena_monsters[42318] = 'spirit of water'
arena_monsters[42319] = 'spirit of fire'
arena_monsters[42320] = 'webster' -- first monster from 3 arena
arena_monsters[42321] = 'darakan the executioner'
arena_monsters[42322] = 'norgle glacierbeard'
arena_monsters[42323] = 'the pit lord'
arena_monsters[42324] = 'svoren the mad'
arena_monsters[42325] = 'the masked marauder'
arena_monsters[42326] = 'gnorre chyllson'
arena_monsters[42327] = "fallen mooh'tah master ghar"
arena_monsters[42328] = 'deathbringer'
arena_monsters[42329] = 'the obliverator'
arena_monsters[42330] = 'Ganady from swamps' -- first monster from 4 arena
arena_monsters[42331] = 'Amad'
arena_monsters[42332] = 'the grim'
arena_monsters[42333] = 'pumpkin of the damned'
arena_monsters[42334] = 'Conisferus'
arena_monsters[42335] = 'the pussy hand'
arena_monsters[42336] = 'mad mariachi'
arena_monsters[42337] = 'leviatan'
arena_monsters[42338] = 'Zanide'
arena_monsters[42339] = 'The Miranox Necromancer'

function getArenaMonsterIdByName(name)
    name = string.lower(tostring(name))
    for i = 42300, 42339 do
        if tostring(arena_monsters[i]) == name then
            return i
        end
    end
    return 0
end