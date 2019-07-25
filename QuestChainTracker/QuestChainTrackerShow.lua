local Congrats_EventFrame = CreateFrame("Frame")
Congrats_EventFrame:RegisterEvent("QUEST_ACCEPTED")
Congrats_EventFrame:SetScript("OnEvent",
	function(self, event, ...)
		local arg1, arg2 = ...
		print('You have accepted quest ID ' .. arg2 .. ', ' .. UnitName("Player") .. '.')
	end)