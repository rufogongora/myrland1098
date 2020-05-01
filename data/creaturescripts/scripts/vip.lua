function onLogin(cid)

accountName = getPlayerAccount(cid)
svip = isSilverVip(accountName)
gvip = isGoldVip(accountName)

if (svip == TRUE) then
                doPlayerSetRate(cid, SKILL__LEVEL, 1.5)

elseif(gvip == TRUE) then
		doPlayerSetRate(cid, SKILL__LEVEL, 2.5)
end
return TRUE
end
return TRUE