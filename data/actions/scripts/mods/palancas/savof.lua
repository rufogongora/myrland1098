function onUse(cid, item, frompos, item2, topos)
	gatepos1 = {x=600, y=1364, z=8, stackpos=1}
	gatepos2 = {x=603, y=1358, z=8, stackpos=1}
	gatepos3 = {x=603, y=1357, z=8, stackpos=1}
	gatepos4 = {x=603, y=1359, z=8, stackpos=1}
	gatepos5 = {x=598, y=1364, z=8, stackpos=1}
	gatepos6 = {x=596, y=1364, z=8, stackpos=1}
	gatepos7 = {x=597, y=1364, z=8, stackpos=1}
	gatepos = {x=599, y=1364, z=8, stackpos=1}
	gatepos8 = {x=601, y=1364, z=8, stackpos=1}
	gatepos9 = {x=602, y=1364, z=8, stackpos=1}

	getgate = getThingfromPos(gatepos)
	getgate1 = getThingfromPos(gatepos1)
	getgate2 = getThingfromPos(gatepos2)
	getgate3 = getThingfromPos(gatepos3)
	getgate4 = getThingfromPos(gatepos4)
	getgate5 = getThingfromPos(gatepos5)
	getgate6 = getThingfromPos(gatepos6)
	getgate7 = getThingfromPos(gatepos7)
	getgate8 = getThingfromPos(gatepos8)
	getgate9 = getThingfromPos(gatepos9)

if item.actionid == 58345 and item.itemid == 1945 and getgate.itemid == 1050 and getgate1.itemid == 1050 and getgate2.itemid == 1049 and getgate3.itemid == 1049 and getgate4.itemid == 1049   then
	doTransformItem(getgate.uid,1547)
	doTransformItem(getgate1.uid,1547)
	doTransformItem(getgate2.uid,1546)
	doTransformItem(getgate3.uid,1546)
	doTransformItem(getgate4.uid,1546)
	doTransformItem(getgate5.uid,1547)
	doTransformItem(getgate6.uid,1547)
	doTransformItem(getgate7.uid,1547)
	doTransformItem(getgate8.uid,1547)
	doTransformItem(getgate9.uid,1547)
		doTransformItem(item.uid,item.itemid+1)

elseif item.actionid == 58345 and item.itemid == 1946 and getgate.itemid == 1547 and getgate1.itemid == 1547 then
	doTransformItem(getgate.uid,1050)
	doTransformItem(getgate1.uid,1050)
	doTransformItem(getgate2.uid,1049)
	doTransformItem(getgate3.uid,1049)
	doTransformItem(getgate4.uid,1049)
	doTransformItem(getgate5.uid,1050)
	doTransformItem(getgate6.uid,1050)
	doTransformItem(getgate7.uid,1050)
	doTransformItem(getgate8.uid,1050)
	doTransformItem(getgate9.uid,1050)
		doTransformItem(item.uid,item.itemid-1)
	else
		doPlayerSendCancel(cid,"Sorry not possible.")
	end
	return true
end