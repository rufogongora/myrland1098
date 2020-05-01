local shutdownAtServerSave = false
local cleanMapAtServerSave = false

local function Broadcast(message) 
    Game.broadcastMessage(message, MESSAGE_STATUS_WARNING)
    print(message)
end

local function serverSave()
    if shutdownAtServerSave then
        Game.setGameState(GAME_STATE_SHUTDOWN)
    else
        Game.setGameState(GAME_STATE_NORMAL)
    end

    if cleanMapAtServerSave then
        cleanMap()
    end

    saveServer()
end

local function secondServerSaveWarning()
    Broadcast('Server is saving game in one minute.');
    addEvent(serverSave, 60000)
end

local function firstServerSaveWarning()
    Broadcast('Server is saving game in 3 minutes.')
    addEvent(secondServerSaveWarning, 120000)
end

function onThink(interval, lastExecution)
    Broadcast('Server is saving game in 5 minutes.')
    Game.setGameState(GAME_STATE_STARTUP)
    addEvent(firstServerSaveWarning, 120000)
    return not shutdownAtServerSave
end