local config = {
    message = "Entra el teleport antes de que desaparesca en 3 minutos!.",
    timeToRemove = 180, -- seconds
    teleportId = 1387,
    bosses = { -- Monster Name, Teleport To Position, Teleport Position
        ["Ushuriel"] = { { x = 334, y = 246, z = 7 }, { x = 385, y = 375, z = 5, stackpos = 1 } },
        ["Annihilon"] = { { x = 334, y = 246, z = 7 }, { x = 457, y = 359, z = 5, stackpos = 1 } },
        ["Hellgorak"] = { {x = 496, y = 671, z = 5}, { x = 462, y = 401, z = 5, stackpos = 1 } },
        ["Madareth"] = { { x = 334, y = 246, z = 7 }, { x = 382, y = 401, z = 5, stackpos = 1 } },
        ["Zugurosh"] = { { x = 334, y = 246, z = 7 }, { x = 419, y = 374, z = 5, stackpos = 1 } },
        ["Latrivan"] = { { x = 334, y = 246, z = 7 }, { x = 417, y = 405, z = 5, stackpos = 1 } },
        ["Satan"] = { { x = 1490, y = 1237, z = 10 }, { x = 1493, y = 1236, z = 10, stackpos = 1 } },
		["Shaul"] = { { x = 598, y = 490, z = 12 }, { x = 584, y = 490, z = 11, stackpos = 1 } },
        ["Azerus"] = { {x = 981, y = 710, z = 9}, {x = 947, y = 710, z = 9, stackpos = 1} },
        ["Plagirath"] = { {x = 1131, y = 836, z = 9}, {x = 1144, y = 790, z = 9, stackpos = 1} },
        ["Mazoran"] = { {x = 1186, y = 836, z = 9}, {x = 1216, y = 786, z = 9, stackpos = 1} },
        ["Zamulosh"] = { {x = 1159, y = 836, z = 9}, {x = 1182, y = 783, z = 9, stackpos = 1} },
        ["Razzagorn"] = { {x = 1131, y = 858, z = 9}, {x = 1252, y = 782, z = 9, stackpos = 1} },
        ["Ragiaz"] = { {x = 1159, y = 857, z = 9}, {x = 1157, y = 745, z = 9, stackpos = 1} },
        ["Tarbaz"] = { {x = 1187, y = 858, z = 9}, {x = 1206, y = 751, z = 9, stackpos = 1} },
        ["Shulgrax"] = { {x = 1159, y = 880, z = 9}, {x = 1255, y = 720, z = 9, stackpos = 1} },

    }
}

local function removal(position)
    if getThingfromPos(position).itemid == config.teleportId then
        doRemoveItem(getThingfromPos(position).uid)
    end
    return TRUE
end

function onDeath(cid, corpse, killer)
    local position = getCreaturePosition(cid)
    for name, pos in pairs(config.bosses) do
        if name == getCreatureName(cid) then
            teleport = doCreateTeleport(config.teleportId, pos[1], pos[2])
            doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
            addEvent(removal, config.timeToRemove * 1000, pos[2])
        end
    end
    return TRUE
end