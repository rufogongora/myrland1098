function onUse(cid, item, frompos, item2, topos)
gatepos = {x=1158, y=247, z=12, stackpos=1}
getgate = getThingfromPos(gatepos)

	item1pos = {x=1139, y=243, z=12, stackpos=1}
		item1 = getThingfromPos(item1pos)
	item2pos = {x=1141, y=243, z=12, stackpos=1}
		item2 = getThingfromPos(item2pos)
	item3pos = {x=1139, y=245, z=12, stackpos=1}
		item3 = getThingfromPos(item3pos)
	item4pos = {x=1141, y=245, z=12, stackpos=1}
		item4 = getThingfromPos(item4pos)

if item.uid == 6666
	and item.itemid == 1945
	and getgate.itemid == 1355
	and item1.itemid == 2492
	and item2.itemid == 2195
	and item3.itemid == 2498
	and item4.itemid == 7382 
then

doRemoveItem(getgate.uid,1)
	doRemoveItem(item1.uid,1)
	doRemoveItem(item2.uid,1)
	doRemoveItem(item3.uid,1)
	doRemoveItem(item4.uid,1)
	doCreatureSay(cid,"El demonio a sido liberado.", TALKTYPE_ORANGE_1)
	doSendMagicEffect(item1pos,23)
	doSendMagicEffect(item2pos,23)
	doSendMagicEffect(item3pos,23)
	doSendMagicEffect(item4pos,23)
	else
		doPlayerSendCancel(cid,"Faltan items para liberar la maldad.")
	end

	gate1pos = {x=822, y=1032, z=11, stackpos=1}
		getgate1 = getThingfromPos(gate1pos)

if item.uid == 6667 and item.itemid == 1945 and getgate1.itemid == 1355 then
	doRemoveItem(getgate1.uid,1)
	doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 6667 and item.itemid == 1946 and getgate1.itemid == 0 then
	doCreateItem(1355,1,gate1pos)
	doTransformItem(item.uid,item.itemid-1)
	else
		doPlayerSendCancel(cid,"Sorry not possible.")
	end
	return true
end