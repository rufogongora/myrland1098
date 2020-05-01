function onUse(cid, item, frompos, item2, topos)
gatepos = {x=510, y=1170, z=11}
getgate = getThingfromPos(gatepos)

	item1pos = {x=536, y=1148, z=11, stackpos=1}
		item1 = getThingfromPos(item1pos)
	item2pos = {x=540, y=1148, z=11, stackpos=1}
		item2 = getThingfromPos(item2pos)
	item3pos = {x=544, y=1148, z=11, stackpos=1}
		item3 = getThingfromPos(item3pos)
	item4pos = {x=548, y=1148, z=11, stackpos=1}
		item4 = getThingfromPos(item4pos)


if item.uid == 12524
	and item1.itemid == 8304
	and item2.itemid == 8300
	and item3.itemid == 8306
	and item4.itemid == 8305 
then

doTeleportThing(cid,gatepos)
	doRemoveItem(item1.uid,1)
	doRemoveItem(item2.uid,1)
	doRemoveItem(item3.uid,1)
	doRemoveItem(item4.uid,1)
	doSendMagicEffect(item1pos,23)
	doSendMagicEffect(item2pos,23)
	doSendMagicEffect(item3pos,23)
	doSendMagicEffect(item4pos,23)
	else
		doPlayerSendCancel(cid,"Los 4 elementos no estan colocados.")
	end
end