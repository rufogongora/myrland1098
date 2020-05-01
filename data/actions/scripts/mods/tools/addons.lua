function onUse(cid, item, frompos, item2, topos)


   	if item.itemid == 8701 then
   		queststatus = getPlayerStorageValue(cid,210001)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Ahora tienes tu Full Demon Hunter Outfit.", TALKTYPE_ORANGE_1)
                        doPlayerAddOutfit(cid, 288, 1) 
                        doPlayerAddOutfit(cid, 289, 1) 
                        doPlayerAddOutfit(cid, 288, 2) 
                        doPlayerAddOutfit(cid, 289, 2)
   			setPlayerStorageValue(cid,210001,1)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Tu ya tienes este addon.")
   		end

   	elseif item.itemid == 7844 then
   		queststatus = getPlayerStorageValue(cid,20002)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Ahora tienes tu Full Hunter outfit.", TALKTYPE_ORANGE_1)
                        doPlayerAddOutfit(cid, 129, 2) 
                        doPlayerAddOutfit(cid, 137, 2) 
                        doPlayerAddOutfit(cid, 129, 1) 
                        doPlayerAddOutfit(cid, 137, 1) 
   			setPlayerStorageValue(cid,20002,1)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Tu ya tienes este addon.")
   		end

   	elseif item.itemid == 8267 then
   		queststatus = getPlayerStorageValue(cid,60001)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Ahora tienes tu Full barbarian outfit.", TALKTYPE_ORANGE_1)
                           doPlayerAddOutfit(cid, 143, 2) 
                        doPlayerAddOutfit(cid, 147, 2) 
                        doPlayerAddOutfit(cid, 143, 1) 
                        doPlayerAddOutfit(cid, 147, 1) 
   			setPlayerStorageValue(cid,60001,1)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Tu ya tienes este addon.")
   		end

   	elseif item.itemid == 5957 then
   		queststatus = getPlayerStorageValue(cid,13540)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Te acabas de convertir en un jugador Vip", TALKTYPE_ORANGE_1)
   			setPlayerStorageValue(cid,13540,1)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Ya eres un jugador VIP.")
   		end

		   	elseif item.itemid == 11292 then
   		queststatus = getPlayerStorageValue(cid,13540)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Te acabas de convertir en un jugador Vip", TALKTYPE_ORANGE_1)
   			setPlayerStorageValue(cid,13540,1)
		
		
   		else
   			doPlayerSendTextMessage(cid,22,"Ya eres un jugador VIP.")
   		end

   	elseif item.itemid == 7723 then
   		queststatus = getPlayerStorageValue(cid,900000)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Ahora tienes tu Full Yalaharian outfit.", TALKTYPE_ORANGE_1)
                           doPlayerAddOutfit(cid, 325, 2) 
                        doPlayerAddOutfit(cid, 324, 2) 
                        doPlayerAddOutfit(cid, 325, 1) 
                        doPlayerAddOutfit(cid, 324, 1) 
   			setPlayerStorageValue(cid,900000,1)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Ya tenias este addon.")
   		end

   	elseif item.itemid == 7722 then
   		queststatus = getPlayerStorageValue(cid,100001)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Ahora tienes tu Full Warrior addon.", TALKTYPE_ORANGE_1)
                        doPlayerAddOutfit(cid, 134, 1) 
                        doPlayerAddOutfit(cid, 142, 1)                      
			doPlayerAddOutfit(cid, 134, 2) 
                        doPlayerAddOutfit(cid, 142, 2) 
   			setPlayerStorageValue(cid,100001,1)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Ya tenias este addon.")
   		end

   	elseif item.itemid == 7724 then
   		queststatus = getPlayerStorageValue(cid,70001)
   		if queststatus == -1 then
   			doCreatureSay(cid,"Ahora tienes tu Full Druid Addon.", TALKTYPE_ORANGE_1)
						doPlayerAddOutfit(cid, 144, 1)
						doPlayerAddOutfit(cid, 148, 1)
						doPlayerAddOutfit(cid, 144, 2)
						doPlayerAddOutfit(cid, 148, 2)
   			setPlayerStorageValue(cid,70001,1)
		doRemoveItem(item.uid,1)
		
   		else
   			doPlayerSendTextMessage(cid,22,"Ya tenias este addon.")
   		end

	end




   	return 1
   end
