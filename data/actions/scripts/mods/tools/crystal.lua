
function onUse(cid, item, frompos, item2, topos)

if item.itemid == 2177 then
doTransformItem(item.uid, 2168)
doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_BLUE)

end
return true
end