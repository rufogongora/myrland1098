local creatureevent = CreatureEvent("RiftInvader")

function creatureevent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local pos = creature:getPosition()
    local x = pos.x;
	local y = pos.y;
	local z = pos.z;
	for i=x-1,x+1 do
		for j=y-1,y+1 do
			local newPos = { x = i, y = j, z = z, stackpos=1 }
            HandleRiftInvaderDeath(newPos)
		end
	end
    return true
end

creatureevent:register()
