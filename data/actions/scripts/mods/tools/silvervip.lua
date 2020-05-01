function onUse(cid, item, fromPosition, itemEx, toPosition)

            if(isPlayer(cid) == TRUE)then
            local days = 60*3600*24
			  if(isGoldVip(getPlayerAccount(cid)))then
	    time1 = getGoldVipTime(getPlayerAccount(cid))
			doPlayerSendTextMessage(cid, 19, "No puedes agregar SilverVIP Mientras tienes GoldenVIP.")
			else
            doAddSilverVipTime(getPlayerAccount(cid), days)
			doPlayerSendTextMessage(cid, 19, "Han sido agregados 60 dias de Silver VIP.")
			doRemoveItem(item.uid)
		end	
	 end

    return TRUE
end