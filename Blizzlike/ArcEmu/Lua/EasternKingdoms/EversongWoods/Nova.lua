--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: AscendScripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local SAY = ChatField.CHAT_MSG_MONSTER_SAY
local EMOTE = ChatField.CHAT_MSG_MONSTER_EMOTE
local UNIVERSAL = LangField.LANG_UNIVERSAL
local THELASSIAN = LangField.LANG_THELASSIAN

function Nova_OnSpawn(Unit, Event)
local RegText = math.random(1,4)
	Unit:RegisterEvent("Nova_SummonCat", 48000, 0)
	if(RegText == 1) then
		Unit:RegisterEvent("Nova_Text", 21000, 0)
	elseif(RegText == 2) then
		Unit:RegisterEvent("Nova_Text", 24000, 0)
	elseif(RegText == 3) then
		Unit:RegisterEvent("Nova_Text", 35000, 0)
	elseif(RegText == 4) then
		Unit:RegisterEvent("Nova_Text", 48000, 0)
	end
end

function Nova_Text(Unit, Event)
local EmoteRandom = math.random(1,3)
	Unit:RegisterEvent("Nova_Talk", 2000, 1)
	if(EmoteRandom == 1) then
		Unit:SendChatMessage(EMOTE, UNIVERSAL, "Nova shakes the dirt loose from the shell.")
	elseif(EmoteRandom == 2) then
		Unit:SendChatMessage(EMOTE, UNIVERSAL, "Nova holds a sea shell up to her ear.")
	elseif(EmoteRandom == 3) then
		Unit:SendChatMessage(EMOTE, UNIVERSAL, "Nova picks up a sea shell.")
	end
end

function Nova_Talk(Unit, Event)
local SayRandom = math.random(1,3)
	Unit:RemoveEvents()
	Unit:RegisterEvent("Nova_OnSpawn", 000, 0)
	if(SayRandom == 1) then
		Unit:SendChatMessage(SAY, THELASSIAN, "I think I can see the Sunwell from here!")
	elseif(SayRandom == 2) then
		Unit:SendChatMessage(SAY, THELASSIAN, "Oooh! Look, a shiny one!")
	elseif(SayRandom == 3) then
		Unit:SendChatMessage(SAY, THELASSIAN, "Can you really hear the ocean from one of these shells?")
	end
end

function Nova_SummonCat(Unit, Event)
	Unit:CastSpell(35052)
end

function Nova_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Nova_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20244, 18, "Nova_OnSpawn")
RegisterUnitEvent(20244, 2, "Nova_OnLeaveCombat")
RegisterUnitEvent(20244, 3, "Nova_OnDied")