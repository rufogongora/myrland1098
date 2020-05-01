local ranks =
{
	--from hightest rank, to lowest
	{level = 135, rank = "a master of life and death"},
	{level = 120, rank = "a PK mastah"},
	{level = 105, rank = "a general"},
	{level = 90, rank = "an experienced guard"},
	{level = 75, rank = "a guard"},
	{level = 60, rank = "an experienced soldier"},
	{level = 45, rank = "a soldier"},
	{level = 40, rank = "a newbie"}
}

function onLogin(cid)
local level = getPlayerLevel(cid)
for _, t in pairs(ranks) do
	if(level >= t.level) then
		doPlayerSetSpecialDescription(cid, "\n" .. (getPlayerSex(cid) == PLAYERSEX_FEMALE and "She" or "He") .. " is " .. t.rank .. ".")
	break
end
end
return true
end