local sparkionMount = Action()
local config = {
    [1] = 87,
}

function sparkionMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if (player:hasMount(config[1])) then
        return;
    end
    player:say('You receive the permission to ride a Rift Runner');
    player:addMount(config[1])
    item:remove();
end

sparkionMount:id(25521)
sparkionMount:register()
