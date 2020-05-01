function onUse(cid, item, fromPosition, itemEx, toPosition)

fireStorage = 12520
	fireSummon = {x="630", y="1018", z="13"}
	firePrize = {x="639", y="1019", z="13"}

iceStorage = 12521
	iceSummon = {x="671", y="1122", z="13"}
	icePrize = {x="683", y="1122", z="13"}


energyStorage = 12522
	energySummon = {x="705", y="999", z="13"}
	energyPrize = {x="719", y="1000", z="13"}

earthStorage = 12523
	earthSummon = {x="744", y="1051", z="13"}
	earthPrize = {x="755", y="1052", z="13"}

masterStorage = 12525
	masterSummon = {x="591", y="1116", z="11"}

if item.uid == fireStorage then
if getPlayerStorageValue(cid,fireStorage) == -1 then
	doSummonCreature("Fire Overlord", fireSummon)
	doSendMagicEffect(fireSummon, CONST_ME_GIFT_WRAPS)
		doCreateItem(8299,1,firePrize)
			setPlayerStorageValue(cid,fireStorage,1)
		return true
	else
		doPlayerSendCancel(cid, "Ya has derrotado al boss.")
	end
end

if item.uid == iceStorage then
if getPlayerStorageValue(cid,iceStorage) == -1 then
	doSummonCreature("Ice Overlord", iceSummon)
	doSendMagicEffect(iceSummon, CONST_ME_GIFT_WRAPS)
		doCreateItem(8302,1,icePrize)
			setPlayerStorageValue(cid,iceStorage,1)
		return true
	else
		doPlayerSendCancel(cid, "Ya has derrotado al boss.")
	end
end

if item.uid == energyStorage then
if getPlayerStorageValue(cid,energyStorage) == -1 then
	doSummonCreature("Energy Overlord", energySummon)
	doSendMagicEffect(energySummon, CONST_ME_GIFT_WRAPS)
		doCreateItem(8303,1,energyPrize)
			setPlayerStorageValue(cid,energyStorage,1)
		return true
	else
		doPlayerSendCancel(cid, "Ya has derrotado al boss.")
	end
end

if item.uid == earthStorage then
if getPlayerStorageValue(cid,earthStorage) == -1 then
	doSummonCreature("Earth overlord", earthSummon)
	doSendMagicEffect(earthSummon, CONST_ME_GIFT_WRAPS)
		doCreateItem(8298,1,earthPrize)
			setPlayerStorageValue(cid,earthStorage,1)
		return true
	else
		doPlayerSendCancel(cid, "Ya has derrotado al boss.")
	end
end

if item.uid == masterStorage then
if getPlayerStorageValue(cid,masterStorage) == -1 then
	doSummonCreature("Lord of the elements", masterSummon)
	doSendMagicEffect(masterSummon, CONST_ME_GIFT_WRAPS)
			setPlayerStorageValue(cid,masterStorage,1)
		return true
	else
		doPlayerSendCancel(cid, "Ya has derrotado al boss.")
	end
end
end