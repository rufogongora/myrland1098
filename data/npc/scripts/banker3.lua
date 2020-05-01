local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local moneyTo = {}
local playerTo = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

        addon_need_premium = 'Sorry, you need a premium account to get addons.' 
        addon_have_already = 'Sorry, you already have this addon.'
        addon_have_not_items = 'Sorry, you dont have these items.' 
        addon_give = 'Here you are.' 
        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
local function isValidMoney(money)
    if isNumber(money) == TRUE and money > 0 and money < 999999999 then
        return TRUE
    end
    return FALSE
end


    if msgcontains(msg, 'help') or msgcontains(msg, 'offer') then
        selfSay("You can check your {balance}, {deposit} or {withdraw} money. You can {transfer} to other players with vocation.", cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Balance (stan) ---------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'account') or msgcontains(msg, 'Balance') then
        selfSay('Your account has '..getPlayerBalance(cid)..' gps.', cid)
        talkState[cid] = 0

    elseif msgcontains(msg, 'asalto') then
        selfSay('Sobre la verga a correr todos!!', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Help (pomoc) -----------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'basic functions') then
        selfSay('Puedes checar el {balance{ of your bank account, Pdeposit{ money or Pwithdraw{ it. You can also {transfer} money to othercharacters, provided that they have a vocation.', cid)
        talkState[cid] = 0
    elseif msgcontains(msg, 'advanced functions') then
        selfSay('Renting a house has never been this easy. Simply make a bid for an auction. We will check immediately if you haveenough money.', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Deposit (wplata) -------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'deposit all') then
        moneyTo[cid] = getPlayerMoney(cid)
        if moneyTo[cid] < 1 then
            selfSay('You dont have money to deposit..', cid)
            talkState[cid] = 0
        else
            selfSay('Would you like to deposit '..moneyTo[cid]..' gps?', cid)
            talkState[cid] = 2
        end
    elseif msgcontains(msg, 'deposit') then
        selfSay("Please tell me the amount you like to deposit?.", cid)
        talkState[cid] = 1
    elseif talkState[cid] == 1 then
        moneyTo[cid] = tonumber(msg)
        if isValidMoney(moneyTo[cid]) == TRUE then
            selfSay('Do you want to deposit '..moneyTo[cid]..' gps?', cid)
            talkState[cid] = 2
        else
            selfSay('Thats not a valid number.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 2 then
        if msgcontains(msg, 'yes') or msgcontains (msg, si) then
            if doPlayerDepositMoney(cid, moneyTo[cid]) ~= TRUE then
                selfSay('You dont have enough money.', cid)
            else
                selfSay('Ok we added '..moneyTo[cid]..' to your bank account. You can {withdraw} money whenever you want. Your balance is  ' .. getPlayerBalance(cid) .. '.', cid)
            end
        elseif msgcontains(msg, 'no') then
            selfSay('Is there anymore else i can do for you?', cid)
        end
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Withdraw (wyplata) -----------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'withdraw') then
        selfSay("Please tell me how much you like to withdraw.", cid)
        talkState[cid] = 6
    elseif talkState[cid] == 6 then
        moneyTo[cid] = tonumber(msg)
        if isValidMoney(moneyTo[cid]) == TRUE then
            selfSay('Are you sure you want to withdraw '..moneyTo[cid]..' gps from your bank account?', cid)
            talkState[cid] = 7
        else
            selfSay('This is not a real amount', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 7 then
        if msgcontains(msg, 'yes') or msgcontains (msg, si) then
            if doPlayerWithdrawMoney(cid, moneyTo[cid]) ~= TRUE then
                selfSay('You dont have enough money in your account. You have '..getPlayerBalance(cid)..' gps. Please tell me how much your going to take.', cid)
            else
                selfSay('Here you are, ' .. moneyTo[cid] .. ' gps. Anything else?.', cid)
                talkState[cid] = 0
            end
        elseif msgcontains(msg, 'no') then
            selfSay('Anything else?', cid)
            talkState[cid] = 0
        end
-----------------------------------------------------------------
---------------------------- Transfer (przelew) -----------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'transfer') then
        selfSay("Please tell me how much you like to transfer.", cid)
        talkState[cid] = 11
    elseif talkState[cid] == 11 then
        moneyTo[cid] = tonumber(msg)
        if isValidMoney(moneyTo[cid]) == TRUE then
            selfSay('To who would you like to transfer '..moneyTo[cid]..' gps', cid)
            talkState[cid] = 12
        else
            selfSay('This is not a real amount.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 12 then
        playerTo[cid] = msg

        if getCreatureName(cid) == playerTo[cid] then
            selfSay('Are you fucking nuts?!', cid)
            talkState[cid] = 0
            return TRUE
        end

        if playerExists(playerTo[cid]) then
            selfSay('So you would like to transfer ' .. moneyTo[cid] .. 'to "' .. playerTo[cid] .. '" ?', cid)
            talkState[cid] = 13
        else
            selfSay('Player with name "' .. playerTo[cid] .. '" doesnt exist.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 13 then
        if msgcontains(msg, 'yes') or msgcontains (msg, si) then
            if getPlayerBalance(cid) < moneyTo[cid] then
                selfSay('You dont have enough money.', cid)
                return TRUE
            end

            if doPlayerTransferMoneyTo(cid, playerTo[cid], moneyTo[cid]) ~= TRUE then
                selfSay('This player doesnt exist, or does not have vocation.', cid)
            else
                selfSay('You have succefully transfered ' .. moneyTo[cid] .. ' to "' .. playerTo[cid] ..' ".', cid)
                playerTo[cid] = nil
            end
        elseif msgcontains(msg, 'no') then
            selfSay('Anything else?', cid)
        end
        talkState[cid] = 0
    end
    return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  