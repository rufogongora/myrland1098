function copyItem(item) 
    if (isContainer(item.uid) == TRUE) then 
        return copyContainer(item.uid, item.itemid) 
    else 
        return doCreateItemEx(item.itemid, item.type) 
    end 
end 

function copyContainer(uid, itemid) 
    local container = doCreateItemEx(itemid, 1) 
    local iterator = getContainerSize(uid) 
    while iterator > 0  do 
        iterator = iterator - 1 
        doAddContainerItemEx(container, copyItem(getContainerItem(uid, iterator))) 
    end 
    return container 
end 

function onUse(cid, item, fromPosition, itemEx, toPosition) 
    if getPlayerStorageValue(cid, item.uid) ~= 1 then 
        local items = {} 
        local item_in = {} 
        local item_slot = 0 
        local item_to_give = 0 
        local item_desc = '' 
        while(true) do 
            item_in = getContainerItem(item.uid, item_slot) 
            if item_in.itemid > 0 then 
                table.insert(items, item_in) 
            else 
                break 
            end 
            item_slot = item_slot+1 
        end 
        if #items == 0 then 
            item_to_give = doCreateItemEx(item.uid) 
            item_desc = getItemNameById(item.uid) 
        elseif #items == 1 then 
            item_to_give = doCreateItemEx(items[1].itemid, items[1].type) 
            item_desc = getItemNameById(items[1].itemid) 
        else 
            if #items <= 8 then 
                item_to_give = doCreateItemEx(1987, 1) 
            else 
                item_to_give = doCreateItemEx(1988, 1) 
            end 
            local n = 0 
            for i=1, #items do 
                n = #items - i + 1 
                doAddContainerItemEx(item_to_give, copyItem(items[n])) 
                item_desc = getItemNameById(items[n].itemid) .. item_desc 
                if i ~= #items then 
                    item_desc = ", " .. item_desc 
                end 
            end 
        end 
        if doPlayerAddItemEx(cid, item_to_give, 0) == RETURNVALUE_NOERROR then 
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. item_desc .. '.') 
            setPlayerStorageValue(cid, item.uid, 1) 
        else 
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You don\'t have enought capacity or free place in backpack for a ' .. item_desc .. '.') 
        end 
    else 
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.") 
    end 
    return TRUE 
end  