function onUse(cid, item, frompos, item2, topos)
-- 100% by Rufo
-- [url]Http://myrland.servegame.com/[/url]

-- Config
-- Esta es de SNOWGROUND!
local storageplay = 58215 -- Storage usado
local nuevapos = {x=1003, y=378, z=6} -- New position
local itemsacid = 2151 -- id del item sacrificado
local amount = 1 -- cuantos necesitas sacrificar
local vip = 13540 -- cuantos necesitas sacrificar
-- End config


if getPlayerStorageValue(cid, storageplay) == 1 then
if getPlayerStorageValue(cid, vip) == 1 then
if isPlayerPzLocked(cid) == FALSE then
	if getPlayerItemCount(cid,itemsacid) >= 1 then
            doTeleportThing(cid,nuevapos)
						doSendMagicEffect(nuevapos,10)

			doPlayerTakeItem(cid,itemsacid,amount)			
           else
		   		        doPlayerSendTextMessage(cid,22,"No tienes suficientes talons")
		end
		else
		        doPlayerSendTextMessage(cid,22,"No puedes transporarte si atacaste a alguien.")

        end
		else
		        doPlayerSendTextMessage(cid,22,"Solo un jugador VIP puede usar el servicio de Myrland Defender.")

        end
        else
        doPlayerSendTextMessage(cid,22,"No has hecho la quest...")

end
return TRUE
end