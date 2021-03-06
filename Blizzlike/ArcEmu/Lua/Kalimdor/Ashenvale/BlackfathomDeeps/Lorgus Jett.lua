-------------------------------------------------------------------
-- This script is created by zdroid9770; please do not edit this --
-- script and claim it as your own, as of All rights are claimed --
-- by me.                                                        --
--                     Copyright � zdroid9770					 --
-------------------------------------------------------------------
--[[
----Spells-ID
Lightning Shield-12550
Lightning Bolt-12167
]]--

function LorgusJett_OnCombat(pUnit, event)
	pUnit:RegisterEvent("LightningBolt", 7000, 0)
	pUnit:RegisterEvent("LightningShield", 14000, 0)
end
 
function LightningBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(12167, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("LightningBolt", 7000, 0)
end
 
function LightningShield(pUnit, Event)
	pUnit:CastSpell(12550)
	pUnit:RegisterEvent("LightningShield", 14000, 0)
end
 
function LorgusJett_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function LorgusJett_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(12902, 1, "LorgusJett_OnCombat")
RegisterUnitEvent(12902, 2, "LorgusJett_OnLeaveCombat")
RegisterUnitEvent(12902, 3, "LorgusJett_OnDeath")