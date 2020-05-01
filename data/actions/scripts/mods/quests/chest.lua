function onUse(cid, item, frompos, item2, topos)

	--- FIBULA quest
	
		   if item.uid == 7891 then
			   queststatus = getPlayerStorageValue(cid,7891)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Bunny Slippers .")
				   doPlayerAddItem(cid,2644,1)
				   setPlayerStorageValue(cid,7891,1)
			   else
				   doPlayerSendTextMessage(cid,22,"It is empty.")
			   end
	
		   elseif item.uid == 7892 then
			   queststatus = getPlayerStorageValue(cid,7892)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Skull helmet.")
				   doPlayerAddItem(cid,5741,1)
				   setPlayerStorageValue(cid,7892,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
	
		   elseif item.uid == 7893 then
			   queststatus = getPlayerStorageValue(cid,7893)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Great Shield.")
				   doPlayerAddItem(cid,2522,1)
				   setPlayerStorageValue(cid,7893,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
	
	
	
		   elseif item.uid == 7894 then
			   queststatus = getPlayerStorageValue(cid,7894)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Titan Axe.")
				   doPlayerAddItem(cid,7413,1)
				   setPlayerStorageValue(cid,7894,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 7895 then
			   queststatus = getPlayerStorageValue(cid,7895)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Sudden Death Rune.")
				   doPlayerAddItem(cid,2268,36)
				   setPlayerStorageValue(cid,7895,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 8336 then
			   queststatus = getPlayerStorageValue(cid,8336)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Soft boots.")
				   doPlayerAddItem(cid,2640,1)
				   setPlayerStorageValue(cid,8336,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 8337 then
			   queststatus = getPlayerStorageValue(cid,8340)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a stuffed dragon.")
				   doPlayerAddItem(cid,5791,1)
				   setPlayerStorageValue(cid,8340,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 8338 then
			   queststatus = getPlayerStorageValue(cid,8338)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found 50 crystal coins.")
				   doPlayerAddItem(cid,2160,50)
				   setPlayerStorageValue(cid,8338,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 8339 then
			   queststatus = getPlayerStorageValue(cid,8339)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Phoenix Shield.")
				   doPlayerAddItem(cid,2539,1)
				   setPlayerStorageValue(cid,8339,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 9993 then
			   queststatus = getPlayerStorageValue(cid,9992)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Queen Sceptre.")
				   doPlayerAddItem(cid,7410,1)
				   setPlayerStorageValue(cid,9992,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 9994 then
			   queststatus = getPlayerStorageValue(cid,9992)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Lunar staff.")
				   doPlayerAddItem(cid,7424,1)
				   setPlayerStorageValue(cid,9992,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
	
		   elseif item.uid == 9991 then
			   queststatus = getPlayerStorageValue(cid,9992)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Ripper Lance.")
				   doPlayerAddItem(cid,3964,1)
				   setPlayerStorageValue(cid,9992,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 9992 then
			   queststatus = getPlayerStorageValue(cid,9992)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,22,"You have found a Rose Shield.")
				   doPlayerAddItem(cid,2527,1)
				   setPlayerStorageValue(cid,9992,1)
			   else
				   doPlayerSendTextMessage(cid,23,"It is empty.")
			   end 
		   elseif item.uid == 13001 then
			   queststatus = getPlayerStorageValue(cid,13001)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,24,"You have found a Steel axe.")
				   doPlayerAddItem(cid,8601,1)
				   setPlayerStorageValue(cid,13001,1)
			   else
				   doPlayerSendTextMessage(cid,24,"It is empty.")
			   end 
	
		   elseif item.uid == 13002 then
			   queststatus = getPlayerStorageValue(cid,13001)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,24,"You have found a Daramanian mace.")
				   doPlayerAddItem(cid,2439,1)
				   setPlayerStorageValue(cid,13001,1)
			   else
				   doPlayerSendTextMessage(cid,24,"It is empty.")
			   end 
		elseif item.uid == 13004 then
				queststatus = getPlayerStorageValue(cid,13004)
				if queststatus == -1 then
					doPlayerSendTextMessage(cid,24,"You have found a one Crystal coin.")
					doPlayerAddItem(cid,2160,1)
					setPlayerStorageValue(cid,13004,1)
				else
					doPlayerSendTextMessage(cid,24,"It is empty.")
			end 
		   elseif item.uid == 13003 then
			   queststatus = getPlayerStorageValue(cid,13001)
			   if queststatus == -1 then
				   doPlayerSendTextMessage(cid,24,"You have found a Jagged sword.")
				   doPlayerAddItem(cid,8602,1)
				   setPlayerStorageValue(cid,13001,1)
			   else
				   doPlayerSendTextMessage(cid,24,"It is empty.")
			end
		elseif item.uid == 13005 then
			queststatus = getPlayerStorageValue(cid,13005)
			if queststatus == -1 then
				doPlayerSendTextMessage(cid,24,"You have found a a Wand of Defiance.")
				doPlayerAddItem(cid,18390,1)
				setPlayerStorageValue(cid,13005,1)
			else
				doPlayerSendTextMessage(cid,24,"It is empty.")
			end
		elseif item.uid == 13006 then
			queststatus = getPlayerStorageValue(cid,13005)
			if queststatus == -1 then
				doPlayerSendTextMessage(cid,24,"You have found a one Bonebreaker.")
				doPlayerAddItem(cid,7428,1)
				setPlayerStorageValue(cid,13005,1)
			else
				doPlayerSendTextMessage(cid,24,"It is empty.")
			end
		elseif item.uid == 13007 then
			queststatus = getPlayerStorageValue(cid,13005)
			if queststatus == -1 then
				doPlayerSendTextMessage(cid,24,"You have found a Havoc Blade.")
				doPlayerAddItem(cid,7405,1)
				setPlayerStorageValue(cid,13005,1)
			else
				doPlayerSendTextMessage(cid,24,"It is empty.")
			end
		elseif item.uid == 13008 then
			queststatus = getPlayerStorageValue(cid,13005)
			if queststatus == -1 then
				doPlayerSendTextMessage(cid,24,"You have found a Solar Axe.")
				doPlayerAddItem(cid,8925,1)
				setPlayerStorageValue(cid,13005,1)
			else
				doPlayerSendTextMessage(cid,24,"It is empty.")
			end
		elseif item.uid == 13009 then
			queststatus = getPlayerStorageValue(cid,13005)
			if queststatus == -1 then
				doPlayerSendTextMessage(cid,24,"You have found a Crystal Crossbow.")
				doPlayerAddItem(cid,18453,1)
				setPlayerStorageValue(cid,13005,1)
			else
				doPlayerSendTextMessage(cid,24,"It is empty.")
			end
		elseif item.uid == 13010 then
			queststatus = getPlayerStorageValue(cid,13005)
			if queststatus == -1 then
				doPlayerSendTextMessage(cid,24,"You have found a Glacial Rod.")
				doPlayerAddItem(cid,18412,1)
				setPlayerStorageValue(cid,13005,1)
			else
				doPlayerSendTextMessage(cid,24,"It is empty.")
			end
	
		end
	

	
		   return 1
	   end
	