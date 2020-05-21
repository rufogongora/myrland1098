local creatureevent = CreatureEvent("FerumbrasDeath")

function creatureevent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    HandleFerumbrasDeath(creature)
end

creatureevent:register()
