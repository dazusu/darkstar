-----------------------------------
-- Area: Jugner Forest
--  MOB: Knight Crab
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    

	local knightCrab = 17203206 -- the ID of the first Knight Crab in Jugner Forest.
	local pop = true;

	for k=knightCrab,knightCrab+10,1 do
		if (GetMobAction(k) ~= ACTION_NONE) then
			pop = false
		end
	end

	if (pop == true) then
		SpawnMob(17203216);
	end
end;