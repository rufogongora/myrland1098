function onSendMail(cid, receiver, item, openBox)
	if (doWriteLogFile("data/logs/sentMailLog.txt", "[".. os.date('%d %B %y - %H:%M') .."] " .. cid .. " sent a parcel to " .. receiver .. " that weighted " .. getItemWeight(item.uid) .. ".")) then
		return true
	else
		print("Can't write log file.")
		return false
	end
	return false
end
