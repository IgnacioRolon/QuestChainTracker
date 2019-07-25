local function MyAddonTestQuest(questID)
	questSearch_isCompleted = IsQuestFlaggedCompleted(questID)
  	if questSearch_isCompleted == false then
  		print("Quest " .. questID .. " yet to complete \124cffffff00\124Hquest:" .. questID .. ":110\124h[Click for more Quest Info]\124h\124r")
  	end
  	return questSearch_isCompleted
end

--Login Message

local Login_EventFrame = CreateFrame("Frame")
Login_EventFrame:RegisterEvent("PLAYER_LOGIN")
Login_EventFrame:SetScript("OnEvent",
	function(self, event, ...)
		if aux == nil then
			print('QuestChainTracker 0.1.5 Beta by Nachpalas for WoW-Freakz loaded. Write "/qc help" to show all commands.')
		end		
		aux = 1
	end)

local flag = 0

local function checkHordeQuest(currentChain)
	englishFaction, localizedFaction = UnitFactionGroup("player")
	auxVar = englishFaction
	if auxVar == 'Horde' then
		finalIndex = table.getn(currentChain)
		for i = 1, finalIndex do
			if MyAddonTestQuest(currentChain[i]) == false then
				flag = 1
				break
			end
		end
		if flag == 0 then
	  		print("No quests left for this chain. If this is a mistake, please report the error on the addon comments or contact Nachsacred#4362 on Discord.")
	  	end 
	  	flag = 0
	end
end

local function checkAllianceQuest(currentChain)
	englishFaction, localizedFaction = UnitFactionGroup("player")
	auxVar = englishFaction
	if auxVar == 'Alliance' then
		finalIndex = table.getn(currentChain)
		for i = 1, finalIndex do
			if MyAddonTestQuest(currentChain[i]) == false then
				flag = 1
				break
			end
		end
		if flag == 0 then
	  		print("No quests left for this chain. If this is a mistake, please report the error on the addon comments or contact Nachsacred#4362 on Discord.")
	  	end 
	  	flag = 0
	end
end

local function checkSuramar7() --Pay attention to this one if there's a dump, trying out new API function.
	localizedClass, englishClass, classIndex = UnitClass("player")
	auxVar = englishFaction
	if classIndex == 12 then
		suramarChain7Quests = {44489, 40307, 40898, 44490, 40328, 40929, 40328, 41097, 40412}
	else
		suramarChain7Quests = {40297, 40307, 40898, 40901, 40328, 40929, 40328, 41097, 40412}
	end
	finalIndex = table.getn(suramarChain7Quests)
	for i = 1, finalIndex do
  		if MyAddonTestQuest(suramarChain7Quests[i]) == false then
  			flag = 1;
	 		break;
	   	end
  	end 
  	if flag == 0 then
  		print("No quests left for this chain. If this is a mistake, please report the error on the addon comments or contact Nachsacred#4362 on Discord.")
  	end 
  	flag = 0
end

local function QuestTrackerCommands(msg, editbox)
  if msg == 'azsuna1' then   
  	HordeQuest = {39718, 41220, 38834, 37653, 37660, 36920, 37656, 37450, 37449}
	AllianceQuest = {39718, 41220, 38834, 37653, 37660, 36920, 37656, 37450, 37449}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'azsuna2' then
  	HordeQuest = {38443, 37853, 37991, 42271, 37855, 37856, 37859, 37858, 37957, 37857, 37960, 37959, 37861, 37862, 38015, 38014, 42567, 42756}
	AllianceQuest = {38443, 37853, 37991, 42271, 37855, 37856, 37859, 37858, 37957, 37857, 37960, 37959, 37861, 37862, 38015, 38014, 42567, 42756}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'azsuna3' then
  	HordeQuest = {37690, 37256, 37733, 37257, 37497, 37486, 37467, 37468, 37736, 37678, 37518, 42370, 42371, 37729, 37730, 37469, 37530, 37470, 38286, 42213}
	AllianceQuest = {37690, 37256, 37733, 37257, 37497, 37486, 37467, 37468, 37736, 37678, 37518, 42370, 42371, 37729, 37730, 37469, 37530, 37470, 38286, 42213}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'azsuna4' then
  	HordeQuest = {38407, 37496, 37507, 37542, 37528, 37510, 37536, 37538, 37565, 37566}
	AllianceQuest = {38407, 37496, 37507, 37542, 37528, 37510, 37536, 37538, 37565, 37566}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'azsuna5' then
  	HordeQuest = {37654, 37657, 37659, 42244}
	AllianceQuest = {37654, 37657, 37659, 40794}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'valsharahintro' then
  	HordeQuest = {39731, 39861, 40122, 38384}
	AllianceQuest = {39731, 39861, 40122, 38384}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'valsharah123' then
  	HordeQuest = {38142, 38455, 38922, 38246, 38143, 38144, 38145, 38147, 38381, 38235, 38225, 38382, 39383, 39384, 40573, 38323}
	AllianceQuest = {38142, 38455, 38922, 38246, 38143, 38144, 38145, 38147, 38381, 38235, 38225, 38382, 39383, 39384, 40573, 38323}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'valsharah4' then
  	HordeQuest = {38377, 38641, 38662, 38655, 38663, 38595, 38582, 38753}
	AllianceQuest = {38377, 38641, 38662, 38655, 38663, 38595, 38582, 38753}
	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'valsharah5' then
  	HordeQuest = {41054, 41890, 43576, 38675, 38684, 43702, 41763, 38743, 40890, 40567}
	AllianceQuest = {41056, 41708, 43576, 38684, 43702, 38743, 40890, 40567} --Alliance quests are not working, pay attention to addon bug reports about these quests. 
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'valsharah6' then
  	HordeQuest = {39149, 38645, 38644, 39117, 38646, 38647, 38691}
	AllianceQuest = {39149, 38645, 38644, 39117, 38646, 38647, 38691}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'valsharah7' then
  	HordeQuest = {38718, 38714, 38715, 38717, 38719, 38724, 38721}
	AllianceQuest = {38718, 38714, 38715, 38717, 38719, 38724, 38721}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain1' then
  	HordeQuest = {39733, 38907, 38911, 39490, 39272, 39491, 39496, 39277, 39614, 39316, 39661, 39489, 39488, 39487, 39498}
	AllianceQuest = {39733, 38907, 38911, 39490, 39272, 39491, 39496, 39277, 39614, 39316, 39661, 39489, 39488, 39487, 39498}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain2' then
  	HordeQuest = {42104, 39026, 39025, 39043, 39027, 38909}
	AllianceQuest = {42104, 39026, 39025, 39043, 39027, 38909}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain3' then --check if this is indeed chapter 3 or 4
  	HordeQuest = {38913, 39318, 38910, 39321, 39429, 39322, 39387}
	AllianceQuest = {38913, 39318, 38910, 39321, 39429, 39322, 39387}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain4' then --check if this is indeed chapter 4 or 3
  	HordeQuest = {38912, 39372, 39873, 39374, 39455, 39860, 39381, 39391, 39425, 39588, 39426, 40229}
	AllianceQuest = {38912, 39372, 39873, 39374, 39455, 39860, 39381, 39391, 39425, 39588, 39426, 40229} 
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain5' then
  	HordeQuest = {40515, 40167, 40520, 39983, 40112, 39988, 39990, 40388, 39992}
	AllianceQuest = {40515, 40167, 40520, 39983, 40112, 39988, 39990, 40388, 39992}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain6' then
  	HordeQuest = {38916, 39575, 40219, 39578, 39577, 39579, 39580}
	AllianceQuest = {38916, 39575, 40219, 39578, 39577, 39579, 39580}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain7' then
  	HordeQuest = {38916, 39575, 40219, 39578, 39577, 39579, 39580}
	AllianceQuest = {38916, 39575, 40219, 39578, 39577, 39579, 39580}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'highmountain8' then
  	HordeQuest = {38915, 39776, 42088, 42512, 40594, 39780}
	AllianceQuest = {38915, 39776, 42088, 42512, 40594, 39780}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramarintro' then
  	HordeQuest = {39986, 39987, 40008, 40123, 40009, 42229, 44672, 40012, 40326, 41702, 41704, 41760, 40011, 40747, 40748, 40830, 44691, 40956}
	AllianceQuest = {39986, 39987, 40008, 40123, 40009, 42229, 44672, 40012, 40326, 41702, 41704, 41760, 40011, 40747, 40748, 40830, 44691, 40956}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar1' then
  	HordeQuest = {40010, 41028, 41138, 41762, 41834, 41989, 42079, 42147, 40324, 40325, 42224, 42225, 42226, 42227, 42228, 42230}
	AllianceQuest = {40010, 41028, 41138, 41762, 41834, 41989, 42079, 42147, 40324, 40325, 42224, 42225, 42226, 42227, 42228, 42230}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar2' then
  	HordeQuest = {41877, 40746, 41148, 40947, 41878, 40730, 40727, 40745, 42722, 42486, 44051, 42487, 42488}
	AllianceQuest = {41877, 40746, 41148, 40947, 41878, 40730, 40727, 40745, 42722, 42486, 44051, 42487, 42488}
  	print("Warning: You need the Friendly Reputation to access this Chapter.")
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar3' then
  	HordeQuest = {42828, 42829, 42832, 42833, 42834, 42835, 42837, 42836, 42838, 44084, 42839, 43969, 42840, 42841, 43352, 42792, 44052}
	AllianceQuest = {42828, 42829, 42832, 42833, 42834, 42835, 42837, 42836, 42838, 44084, 42839, 43969, 42840, 42841, 43352, 42792, 44052}
  	print("Warning: You need the Honored Reputation to access this Chapter.")
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar4' then
  	HordeQuest = {43309, 43310, 43312, 44040, 43311, 43315, 43313, 43317, 43318}
	AllianceQuest = {43309, 43310, 43312, 44040, 43311, 43315, 43313, 43317, 43318}
	print("Warning: You need the Honored Reputation to access this Chapter.")
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar5' then
  	HordeQuest = {44053, 42490, 42491, 43314, 44152, 43360, 43361, 44156, 40125, 43362}
	AllianceQuest = {44053, 42490, 42491, 43314, 44152, 43360, 43361, 44156, 40125, 43362}
	print("Warning: You need the Revered Reputation to access this Chapter.")
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar6' then
  	HordeQuest = {43502, 43562, 43563, 43564, 43565, 43567, 43568, 43569}
	AllianceQuest = {43502, 43562, 43563, 43564, 43565, 43567, 43568, 43569}
	print("Warning: You need the Revered Reputation to access this Chapter.")
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar7' then
  	checkSuramar7() --Pay attention to this one if there's a dump, trying out new API function.
  elseif msg == 'suramar8' then
  	HordeQuest = {40883, 40963, 40964, 41032, 40965, 40967, 40969, 40970, 40971, 40972}
	AllianceQuest = {40883, 40963, 40964, 41032, 40965, 40967, 40969, 40970, 40971, 40972}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar9' then
  	HordeQuest = {40744, 40266, 40227, 40300, 40578, 40306, 40315, 40319, 40321}
	AllianceQuest = {40744, 40266, 40227, 40300, 40578, 40306, 40315, 40319, 40321}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar10' then
  	HordeQuest = {41452, 41453, 41197, 41463, 41464, 41467, 41473, 41475, 41474, 41478, 41480, 41485, 41479, 41469, 41494}
	AllianceQuest = {41452, 41453, 41197, 41463, 41464, 41467, 41473, 41475, 41474, 41478, 41480, 41485, 41479, 41469, 41494}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'suramar11' then
  	HordeQuest = {40907, 40908, 40320, 40331, 40332, 40334, 41034, 40927, 41426, 41606, 41618, 40364, 41709, 41425, 41410, 41409, 41001, 41499, 40336}
	AllianceQuest = {40907, 40908, 40320, 40331, 40332, 40334, 41034, 40927, 41426, 41606, 41618, 40364, 41709, 41425, 41410, 41409, 41001, 41499, 40336}
	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'stormheimintro' then
  	HordeQuest = {38307, 39698, 39801, 38332, 38360, 38362}
  	AllianceQuest = {38035, 38206, 39800, 38052, 38036, 38053, 38558, 38058, 38060}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'stormheim3' then
  	HordeQuest = {38459, 38331, 39590, 39593, 39591, 39592, 39594, 39597}
  	AllianceQuest = {38210, 38331, 39590, 39593, 39591, 39592, 39594, 39597}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'stormheim4' then
  	HordeQuest = {38611, 38612, 38613, 38614, 38615, 38617, 38618, 38414, 38413, 40568, 39652, 38624}
  	AllianceQuest = {38473, 38312, 38318, 38405, 38410, 38342, 38412, 38414, 38413, 40568, 39652, 38624}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'stormheim5' then
  	HordeQuest = {39803, 39804, 39796, 38778, 39788, 38810, 38808, 38811, 38817, 38816, 38823, 38815, 38818}
  	AllianceQuest = {39803, 39804, 39796, 38778, 39788, 38810, 38808, 38811, 38817, 38816, 38823, 38815, 38818}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'stormheim6' then
  	HordeQuest = {39837, 38324, 38339, 38347, 39848, 39857, 39849, 39850, 39851, 39853, 39855}
  	AllianceQuest = {39837, 38324, 38339, 38347, 39848, 39857, 39849, 39850, 39851, 39853, 39855}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'stormheim7' then
  	HordeQuest = {38872, 38873, 39153, 39385, 39154, 38878, 39155, 38882}
  	AllianceQuest = {39059, 39060, 39061, 39472, 39062, 39063, 39092, 39122}
  	checkHordeQuest(HordeQuest)
  	checkAllianceQuest(AllianceQuest)
  elseif msg == 'stormheim8' then
    HordeQuest = {40078, 40001, 40002, 40003, 40004, 40005}
    AllianceQuest = {40078, 40001, 40002, 40003, 40004, 40005}
    checkHordeQuest(HordeQuest)
    checkAllianceQuest(AllianceQuest)

  elseif msg == 'help' then
  	print("Welcome to QuestChain Tracker. Select one of the following commands to check completed storylines or quest chains based on their chapter number.")
  	print("Example: /qc azsuna5")
  	print("For the Azsuna Storyline: azsuna1, azsuna2, azsuna3, azsuna4, azsuna5")
  	print("For the Val'sharah Storyline: valsharahintro, valsharah123, valsharah4, valsharah5, valsharah6, valsharah7")
  	print("For the Highmountain Storyline: highmountain1, highmountain2, highmountain3, highmountain4, highmountain5, highmountain6, highmountain7, highmountain8")
  	print("For the Stormheim Storyline: stormheimintro (which includes Chapters 1 & 2), stormheim3, stormheim4, stormheim5, stormheim6, stormheim7, stormheim8")
  	print("For the Suramar Storyline: suramarintro (which includes Nightfall, Arcanist Kel'danath & Chief Telemancer Oculeth), suramar1, suramar2, suramar3, suramar4, suramar5, suramar6 (remember that up to Chapter 6, these chains are part of the main Storyline and require reputation with the Nightfallen), suramar7, suramar8, suramar9, suramar10, suramar11")
  	print("If you find any problems with the addon or the storylines seem to be wrong, contact Nachsacred#4362 on Discord to report the bug.")
  else
    print("Invalid quest chain or argument.")
  end
end

SLASH_QUESTCHECK1, SLASH_QUESTCHECK2 = '/qc', '/questcheck'

SlashCmdList["QUESTCHECK"] = QuestTrackerCommands   -- add /qc and /questcheck to command SlashCmdList

--print("\124cffffff00\124Hquest:46769:110\124h[Arugal's Folly]\124h\124r")