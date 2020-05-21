local sparkionMount = Action()
local config = {
    [1] = 94,
    [2] = 98,
    [3] = 99
}

function sparkionMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local val = math.random(10);
    if (player:getStorageValue(26194) == 1) then
        player:say('You already know how to mount a sparkion.')
        return;
    end
    if (val < 1) then
        player:addMount(config[3])
        player:say('You receive the permission to ride a Vortexion.');
    elseif (val < 4) then
        player:addMount(config[2])
        player:say('You receive the permission to ride a Neon Sparkid');
    else
        player:say('You receive the permission to ride a Sparkion');
        player:addMount(config[1])
    end
    player:setStorageValue(26194, 1);
   
    item:remove();
end

sparkionMount:id(26194)
sparkionMount:register()
