function onUse(cid, item, frompos, item2, topos)


--Config
local lifeid = 10290
local manaid = 10289
local amountlife = 100
local amountmana = 100
local timeslife = 2
local timesmana = 2
--End config

   	if item.itemid == lifeid then
		vida = getCreatureMaxHealth(cid)+amountlife
   		queststatus = getPlayerStorageValue(cid,53131)
		questus = getPlayerStorageValue(cid,53131)+1
   		if queststatus < timeslife then
   			doCreatureSay(cid,"Has ganado algo de extra HP.", TALKTYPE_ORANGE_1)
                 setCreatureMaxHealth(cid,vida)
   			setPlayerStorageValue(cid,53131,questus)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Ya no te puedes subir mas HP.")
   		end





   	elseif item.itemid == manaid then
		vida = getCreatureMaxMana(cid)+amountmana
   		queststatus = getPlayerStorageValue(cid,53132)
		questus = getPlayerStorageValue(cid,53132)+1
   		if queststatus < timesmana then
   			doCreatureSay(cid,"Has ganado algo de extra mana.", TALKTYPE_ORANGE_1)
                 setCreatureMaxMana(cid,vida)
   			setPlayerStorageValue(cid,53132,questus)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Ya no te puedes subir mas mana.")
   		end

	

	end




   	return 1
   end
