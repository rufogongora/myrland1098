function onUse(cid, item, frompos, item2, topos)
	gatepos1 = {x=1052, y=1119, z=7, stackpos=1}
	gatepos2 = {x=1053, y=1119, z=7, stackpos=1}
	gatepos3 = {x=1054, y=1119, z=7, stackpos=1}
	gatepos4 = {x=1055, y=1119, z=7, stackpos=1}
	gatepos5 = {x=1056, y=1119, z=7, stackpos=1}

		accion = 9254
		queststorage = 24761

	getgate1 = getThingfromPos(gatepos1)
	getgate2 = getThingfromPos(gatepos2)
	getgate3 = getThingfromPos(gatepos3)
	getgate4 = getThingfromPos(gatepos4)
	getgate5 = getThingfromPos(gatepos5)

		queststatus = getPlayerStorageValue(cid,queststorage)

if queststatus == 1 and item.itemid == 1945 and getgate5.itemid == 1547 and getgate1.itemid == 1547 then
	doRemoveItem(getgate1.uid,1)
	doRemoveItem(getgate2.uid,1)
	doRemoveItem(getgate3.uid,1)
	doRemoveItem(getgate4.uid,1)
	doRemoveItem(getgate5.uid,1)
		doTransformItem(item.uid,item.itemid+1)

elseif queststatus == 1 and item.itemid == 1946 and getgate5.itemid == 0 then
doCreateItem(1547,1,gatepos1)
	doCreateItem(1547,1,gatepos2)
	doCreateItem(1547,1,gatepos3)
	doCreateItem(1547,1,gatepos4)
	doCreateItem(1547,1,gatepos5)
		doTransformItem(item.uid,item.itemid-1)
	else
		doPlayerSendCancel(cid,"Eres muy debil como para halar esta palanca.")
	end
	return true
end