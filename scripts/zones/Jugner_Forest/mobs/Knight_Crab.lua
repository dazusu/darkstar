-----------------------------------
-- Area: Jugner Forest
--  MOB: Knight Crab
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    SetServerVariable("[POP]King_Arthro",0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

	local knightCrab = 17203206 -- the ID of the first Knight Crab in Jugner Forest.
	local pop = true;

	for k=knightCrab,10 do
		printf("Mob: %s - ACTION: %s = %s",k,GetMobAction(k),ACTION_NONE)
		if (GetMobAction(k) ~= ACTION_NONE) then
			pop = false
		end
	end

	if (pop == true) then
		SpawnMob(17203216);
	end
end;