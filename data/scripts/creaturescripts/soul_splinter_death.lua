local creatureevent = CreatureEvent("SoulSplinter")

function creatureevent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    HandleSoulSplinterDeath()
end

creatureevent:register()
