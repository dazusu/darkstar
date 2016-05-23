------------------------------------------------------------------------------------------
--  Logging 2.0 (ACRE - Update 13/05/2016)
--  Note: When implementing new zones, ensure there are more logging point locations
--  than there are logging points for the zone.
-- 	Drop rates have been truncated down onto 4 ratio's as follows: 
--				Common 		1000
--				Uncommon	300
--				Rare		200
--				Very Rare	100
------------------------------------------------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/utils");

-- Note: All drops are weights, these are /not/ percentages.

local extracted = {
    [2] = { -- Carpenter's Landing
        {1000,693}, -- Walnut Log (Common)
		{1000,695}, -- Willow Log (Common)
		{300,696}, -- Yew Log (Uncommon)
        {200,688}, -- Arrowood Log (Rare)
		{200,698}, -- Ash Log (Rare)
		{200,923}, -- Dryad Root (Rare)
		{100,4505}, --Acorn (Very Rare)
		{100,699}, -- Oak Log (Very Rare)
    },
    [24] = { -- Lufaise Meadows
        {1000,688}, -- Arrowood Log (Common)
		{1000,698}, -- Ash Log (Common)
		{1000,691}, -- Maple Log (Common)
        {300,4363}, -- Faerie Apple (Uncommon)
        {200,693}, -- Walnut Log (Rare)
		{100,4505}, --Acorn (Very Rare)
		{100,690}, -- Elm Log (Very Rare) 
		{100,699}, -- Oak Log (Very Rare) 
    },
	[25] = { -- Misareaux Coast
        {300,688}, -- Arrowood Log (Uncommon)
        {300,4363}, -- Faerie Apple (Uncommon)
		{200,698}, -- Ash Log (Rare)
		{200,691}, -- Maple Log (Rare)
        {200,693}, -- Walnut Log (Rare)
		{100,4505}, --Acorn (Very Rare)
		{100,690}, -- Elm Log (Very Rare) 
		{100,699}, -- Oak Log (Very Rare) 
    },
    [101] = { -- East Ronfaure
        {1000,688}, -- Arrowood Log (Common)
		{1000,698}, -- Ash Log (Common)
		{1000,691}, -- Maple Log (Common)
		{200,694}, -- Chestnut Log (Rare)
		{200,574}, -- Fruit Seeds (Rare)
		{200,696}, -- Yew Log (Rare)
		{100,639}, -- Chestnut (Very Rare)
    },
    [104] = { -- Jugner Forest
        {1000,693}, -- Walnut Log (Common)
		{1000,695}, -- Willow Log (Common)
		{1000,696}, -- Yew Log (Common)
        {300,688}, -- Arrowood Log (Uncommon)
		{300,698}, -- Ash Log (Uncommon)
		{200,4505}, --Acorn (Rare)
		{200,923}, -- Dryad Root (Rare)
		{100,699}, -- Oak Log (Very Rare)
	},
    [118] = { -- Buburimu Peninsula
		{1000,689}, -- Lauan Log (Common)
        {1000,688}, -- Arrowood Log (Common)
		{1000,4445}, -- Yagudo Cherry (Common)
		{300,4503}, -- Buburimu Grape (Uncommon)
		{200,923}, -- Dryad Root (Rare)
		{200,574}, -- Fruit Seeds (Rare)
		{200,697}, -- Holly Log (Rare)
		{100,702}, -- Ebony Log (Very Rare)
		{100,700}, -- Mahogony Log (Very Rare)
		{100,701}, -- Rosewood Log (Very Rare)
	},
    [123] = { -- Yuhtunga Jungle
	    {1000,688}, -- Arrowood Log (Common)
		{1000,721}, -- Rattan Lumber (Common)
		{300,689}, -- Lauan Log (Uncommon)	
		{200,731}, -- Aquilaria Log (Rare)
		{200,912}, -- Beehive Chip (Rare)	
		{200,697}, -- Holly Log (Rare)	
		{200,940}, -- Revival Tree Root (Rare)	
		{100,702}, -- Ebony Log (Very Rare)	
		{100,701}, -- Rosewood Log (Very Rare)	
		{100,1237}, -- Tree Cuttings (Very Rare)	
		{100,5662}, -- Dragon Fruit (Very Rare)	
	},	
    [124] = { -- Yhoator Jungle
	    {1000,688}, -- Arrowood Log (Common)
		{1000,721}, -- Rattan Lumber (Common)
		{1000,689}, -- Lauan Log (Common)
		{300,912}, -- Beehive Chip (Uncommon)				
		{200,923}, -- Dryad Root (Rare)
		{100,731}, -- Aquilaria Log (Very Rare)	
		{100,702}, -- Ebony Log (Very Rare)
		{100,700}, -- Mahogony Log (Very Rare)
		{100,940}, -- Revival Tree Root (Very Rare)	
		{100,1237}, -- Tree Cuttings (Very Rare)	
	},
    [140] = { -- Ghelsba Outpost
        {1000,688}, -- Arrowood Log (Common)
		{1000,698}, -- Ash Log (Common)
		{1000,691}, -- Maple Log (Common)
		{200,695}, -- Willow Log (Rare)	
		{200,690}, -- Elm Log (Rare)	
		{200,697}, -- Holly Log (Rare)
	},
}

------------------------------------------------------------------------------------------
--  Logging 2.0 (ACRE - Update 13/05/2016)
--  Note: NPC ID's per zone
-- 	Example: Zone {npcid,npcid,npcid,...}
------------------------------------------------------------------------------------------

local loggingpoints = {
	[2] = {16785769,16785770,16785771,16785772}, -- Carpenter's Landing
	[24] = {16875879,16875880,16875881,16875882,16875883,16875884}, -- Lufaise Meadows
	[25] = {16879968,16879969,16879970,16879971,16879972,16879973}, -- Misareaux Coast
	[101] = {17191526,17191527,17191528,17191529,17191530,17191531}, -- East Ronfaure
	[104] = {17203860,17203861,17203862,17203863,17203864,17203865}, -- Jugner Forest
	[118] = {17261171,17261172,17261173,17261174,17261175,17261176}, -- Buburimu Peninsula
	[123] = {17281626,17281627,17281628,17281629,17281630,17281631}, -- Yuhtunga Jungle
	[124] = {17285671,17285672,17285673,17285674,17285675,17285676}, -- Yhoator Jungle
	[140] = {17350970,17350971,17350972,17350973} -- Ghelsba Outpost
}

local coordinates = {
	[2] = {
		{198.306,-6.75,-562.259},   -- Zone: Carpenters_Landing
		{118.541,-6.685,-405.259},   -- Zone: Carpenters_Landing
		{-117.587,-6.529,-482.574},   -- Zone: Carpenters_Landing
		{-174.078,-6.254,-442.14},   -- Zone: Carpenters_Landing
		{-169.623,-14.464,-512.819},   -- Zone: Carpenters_Landing
		{-204.153,-6.761,-119.146},   -- Zone: Carpenters_Landing
		{-319.104,-6.75,-82.24},   -- Zone: Carpenters_Landing
		{-242.51,-5.996,-22.45},   -- Zone: Carpenters_Landing
		{-189.412,-5.335,92.033}   -- Zone: Carpenters_Landing
	},
	[124] = {
		{-6.343,-3.515,-87.118},   -- Zone: Yhoator_Jungle
		{-22.81,6.09,-90.663},   -- Zone: Yhoator_Jungle
		{-5.682,-4.05,-117.021},   -- Zone: Yhoator_Jungle
		{-455.557,2.105,-131.032},   -- Zone: Yhoator_Jungle
		{-463.504,3.888,-177.802},   -- Zone: Yhoator_Jungle
		{-463.159,0.188,-214.968},   -- Zone: Yhoator_Jungle
		{-461.987,-0.611,-162.186},   -- Zone: Yhoator_Jungle
		{-384.149,1.855,-16.146},   -- Zone: Yhoator_Jungle
		{-377.64,-0.553,37.098},   -- Zone: Yhoator_Jungle
		{-307.967,0.953,16.002},   -- Zone: Yhoator_Jungle
		{-278.469,-0.642,58.416},   -- Zone: Yhoator_Jungle
		{-167.848,-0.053,21.493},   -- Zone: Yhoator_Jungle
		{-133.895,-0.587,12.853},   -- Zone: Yhoator_Jungle
		{-91.976,-0.842,23.711},   -- Zone: Yhoator_Jungle
		{-66.181,-0.853,10.011},   -- Zone: Yhoator_Jungle
		{-28.515,-3.173,-139.615}   -- Zone: Yhoator_Jungle
	},
	[123] = {
		{-112.696,-3.285,-88.752},   -- Zone: Yuhtunga_Jungle
		{-82.615,-0.428,-180.782},   -- Zone: Yuhtunga_Jungle
		{-205.044,-0.299,-220.019},   -- Zone: Yuhtunga_Jungle
		{-177.925,-0.507,-196.699},   -- Zone: Yuhtunga_Jungle
		{-176.488,3.871,-182.233},   -- Zone: Yuhtunga_Jungle
		{-218.565,2.011,-141.177},   -- Zone: Yuhtunga_Jungle
		{-35.476,-0.523,-422.084},   -- Zone: Yuhtunga_Jungle
		{-36.274,-0.664,-463.45},   -- Zone: Yuhtunga_Jungle
		{21.844,4.262,-495.023},   -- Zone: Yuhtunga_Jungle
		{-311.391,-1.249,-21.18},   -- Zone: Yuhtunga_Jungle
		{-305.718,8.524,0.09},   -- Zone: Yuhtunga_Jungle
		{-271.237,-0.868,-22.414},  -- Zone: Yuhtunga_Jungle
		{-291.983,-5.301,0.529},   -- Zone: Yuhtunga_Jungle
		{-541.831,-0.507,162.693},   -- Zone: Yuhtunga_Jungle
		{-506.284,-0.349,186.075},   -- Zone: Yuhtunga_Jungle
		{-497.049,-0.25,229.809}   -- Zone: Yuhtunga_Jungle
	},
	[118] = {
		{-65.648,-0.473,-170.359},   -- Zone: Buburimu_Peninsula
		{-84.522,-1.02,-176.713},   -- Zone: Buburimu_Peninsula
		{56.732,-0.093,-207.318},   -- Zone: Buburimu_Peninsula
		{17.573,-1.575,-293.985},   -- Zone: Buburimu_Peninsula
		{98.027,-0.689,-148.377},   -- Zone: Buburimu_Peninsula
		{392.699,-0.378,-140.751},   -- Zone: Buburimu_Peninsula
		{434.036,-0.344,-191.165},   -- Zone: Buburimu_Peninsula
		{434.408,-0.628,-210.972},   -- Zone: Buburimu_Peninsula
		{514.326,-0.469,-212.832},   -- Zone: Buburimu_Peninsula
		{532.471,-0.504,-267.012},   -- Zone: Buburimu_Peninsula
		{528.582,-0.762,-270.122},   -- Zone: Buburimu_Peninsula
		{502.713,-0.651,-16.592},   -- Zone: Buburimu_Peninsula
		{460.408,-0.07,-7.679},  -- Zone: Buburimu_Peninsula
		{433.863,-1.538,9.799},   -- Zone: Buburimu_Peninsula
		{306.851,-0.435,90.114},   -- Zone: Buburimu_Peninsula
		{312.321,-1.14,42.644},   -- Zone: Buburimu_Peninsula
		{339.651,-0.015,47.341},   -- Zone: Buburimu_Peninsula
		{312.783,-0.456,186.088},   -- Zone: Buburimu_Peninsula
		{315.316,-0.78,194.892},   -- Zone: Buburimu_Peninsula
		{413.152,-0.345,202.133},   -- Zone: Buburimu_Peninsula
		{410.538,-0.798,207.165},   -- Zone: Buburimu_Peninsula
		{387.256,-1.08,241.808},   -- Zone: Buburimu_Peninsula
		{394.261,-1.133,246.33},   -- Zone: Buburimu_Peninsula
		{395.538,-0.38,291.989},   -- Zone: Buburimu_Peninsula
		{398.247,-0.717,310.669},   -- Zone: Buburimu_Peninsula
		{388.167,-0.814,317.613},   -- Zone: Buburimu_Peninsula
		{388.167,-0.814,317.613}   -- Zone: Buburimu_Peninsula
	},
	[104] = {
		{217.654,-0.2,-282.637},   -- Zone: Jugner_Forest
		{262.127,-7.956,-409.445},   -- Zone: Jugner_Forest
		{302.444,-15.526,-467.624},   -- Zone: Jugner_Forest
		{329.294,-16.624,-431.135},   -- Zone: Jugner_Forest
		{317.242,-16.75,-522.484},   -- Zone: Jugner_Forest
		{245.39,-9.174,-490.334},   -- Zone: Jugner_Forest
		{203.14,-9.953,-445.687},   -- Zone: Jugner_Forest
		{208.67,-9.295,-417.608},   -- Zone: Jugner_Forest
		{-298.288,-0.093,-204.743},   -- Zone: Jugner_Forest
		{-280.729,-8.893,-162.306},   -- Zone: Jugner_Forest
		{-311.295,-1.057,-133.244},   -- Zone: Jugner_Forest
		{-253.851,-1.067,-127.375},   -- Zone: Jugner_Forest
		{-341.789,6.382,151.25},   -- Zone: Jugner_Forest
		{-360.881,6.258,169.632},   -- Zone: Jugner_Forest
		{-363.178,-0.75,278.731},   -- Zone: Jugner_Forest
		{-425.214,4.107,272.399},   -- Zone: Jugner_Forest
		{188.974,-0.552,283.586},   -- Zone: Jugner_Forest
		{165.421,-0.449,289.353},   -- Zone: Jugner_Forest
		{181.363,-2.189,304.429},   -- Zone: Jugner_Forest
		{167.117,0.056,341.545},   -- Zone: Jugner_Forest
		{241.091,-0.75,362.195},   -- Zone: Jugner_Forest
		{276.728,-1.194,353.28},   -- Zone: Jugner_Forest
		{248.974,-0.546,286.756}   -- Zone: Jugner_Forest
	},
	[101] = {
		{477.352,-10.75,-439.657},   -- Zone: Ronfaure_East
		{501.474,-10.996,-402.469},   -- Zone: Ronfaure_East
		{461.719,-20.691,-290.689},   -- Zone: Ronfaure_East
		{383.562,-20.462,-326.598},   -- Zone: Ronfaure_East
		{474.627,-18.976,-329.575},   -- Zone: Ronfaure_East
		{505.626,-20.595,-242.151},   -- Zone: Ronfaure_East
		{509.759,-21.227,-217.52 },  -- Zone: Ronfaure_East
		{457.045,-17.019,-184.982},   -- Zone: Ronfaure_East
		{389.334,-21.101,-174.189},   -- Zone: Ronfaure_East
		{361.317,-20.291,-192.276},   -- Zone: Ronfaure_East
		{307.064,-31.977,-66.766},   -- Zone: Ronfaure_East
		{409.825,-29.613,-54.721},   -- Zone: Ronfaure_East
		{218.356,-40.765,29.408},   -- Zone: Ronfaure_East
		{285.015,-40.426,29.147},   -- Zone: Ronfaure_East
		{392.198,-40.128,-2.015},   -- Zone: Ronfaure_East
		{427.166,-32.294,-24.21},   -- Zone: Ronfaure_East
		{405.994,-40.507,42.351},   -- Zone: Ronfaure_East
		{346.166,-47.568,78.103},   -- Zone: Ronfaure_East
		{334.922,-47.102,178.825},   -- Zone: Ronfaure_East
		{376.858,-48.857,149.818},   -- Zone: Ronfaure_East
		{453.355,-47.113,145.003},   -- Zone: Ronfaure_East
		{531.192,-41.163,61.975},   -- Zone: Ronfaure_East
		{609.596,-55.025,190.296}   -- Zone: Ronfaure_East
	},
	[140] = {
		{2.417,-0.894,35.151},   -- Zone: Ghelsba_Outpost
		{-12.554,-1.445,23.943},   -- Zone: Ghelsba_Outpost
		{-17.969,-1.629,17.687},   -- Zone: Ghelsba_Outpost
		{-57.75,-0.75,36.797},   -- Zone: Ghelsba_Outpost
		{-51.87,-0.75,32.618},  -- Zone: Ghelsba_Outpost
		{-16.936,-1.354,59.533},   -- Zone: Ghelsba_Outpost
		{-11.901,-0.75,77.116},   -- Zone: Ghelsba_Outpost
		{-8.232,-1.168,67.939},   -- Zone: Ghelsba_Outpost
		{12.273,-1.229,89.419},   -- Zone: Ghelsba_Outpost
		{20.249,-1.238,75.525},   -- Zone: Ghelsba_Outpost
		{7.887,-1.283,71.212},   -- Zone: Ghelsba_Outpost
		{2.363,-1.633,13.035},   -- Zone: Ghelsba_Outpost
		{7.623,-1.146,6.862},   -- Zone: Ghelsba_Outpost
		{16.598,-1.214,-4.664},   -- Zone: Ghelsba_Outpost
		{-2.549,-1.327,-21.346}   -- Zone: Ghelsba_Outpost
	}
}

------------------------------------------------------------------------------------------
--  Logging 2.0 (ACRE - Update 13/05/2016)
--  Note: Functions
------------------------------------------------------------------------------------------


function startLogging(player, zone, npc, trade, cutsceneId)

    -- Check that the user has a pickaxe, and has traded a single one.
    if (trade:hasItemQty(1021,1) and trade:getItemCount() == 1) then
        local broken = hatchetBreak(player,trade);
        local item = getLoggingItem(player,zone);
        local full = (player:getFreeSlotsCount() == 0 and 1 or 0);
        local hitCount = npc:getLocalVar("HIT_COUNT") - 1;
        --printf("Mining: full: %s, item: %s, hitCount: %s, id: %s", full, item, hitCount, npc);
        if (item ~= 0) then
            if (hitCount == -1) then -- hits will only ever be -1 after a server reset.
                hitCount = math.random(4,5);
            end
            if (hitCount == 0) then
                moveLoggingPoint(player,npc,zone);
            end;
        end
        --printf("Mining: setting hitcount to %s, id: %s",hitCount,npc);

        -- Mining event
        player:startEvent(cutsceneId,item,broken,full);

        -- If we are full, or there was no item found, we don't use up a "hit", so don't log the hit
        -- or attempt to reward the item.
        if (item ~= 0 and full == 0) then
            -- Update the hit count on the mining point.
            npc:setLocalVar("HIT_COUNT",hitCount);
            player:addItem(item);
        end;
    end;

end;

-----------------------------------
--  Logging 2.0 (ACRE - Update 13/05/2016)
-- 	Determine if Hatchet breaks
-----------------------------------

function hatchetBreak(player,trade)
    local broken = 0;
    if (math.random(0,100) <= LOGGING_BREAK_CHANCE) then
        broken = 1;
        player:tradeComplete();
    end;
    return broken;
end;
-------------------------------------------------
-- Determine the obtained item.
-------------------------------------------------

function getLoggingItem(player,zone) 
    -- declare the winning item!
    local item = 0;
    if (math.random(0,100) >= LOGGING_RATE) then
        -- no item
        return item;
    end;

    -- Get the drop array from the master drops array.
    local drops = extracted[zone];

    -- Get the total of all drop weights
    -- {rate,item}
    local total = 0;
    for i=1,#drops do
        total = total+drops[i][1] -- [1] = rate, [2] = item
    end;

    --printf("Total: %s",total);

    -- Get a random number that will determine the drop from the array.
    local tickerStop = math.random(1,total);

    local countPosition = 0;
    -- find out the winning item from the drops array.
    for i=1,#drops do
        countPosition = countPosition+drops[i][1]; -- [1] = rate, [2] = item
        if (countPosition >= tickerStop) then 
            item = drops[i][2]; -- [1] = rate, [2] = item
            break;
        end;
    end;

    --printf("Item: %s",item);

    return item;
end;

-------------------------------------------------
-- Moves mining point.
-------------------------------------------------

function moveLoggingPoint(player,npc,zone)

    local positions = utils.shuffle(coordinates[zone]);
    local points = loggingpoints[zone];
    local newIndex = -1;

    if (positions ~= nil) then
        -- Generate a list of used indexes for all mining points in this zone.
        for i,p in ipairs(points) do -- loop through all mining points
            for c, v in ipairs(positions) do -- find index of this specific point
                local currentnpc = GetNPCByID(p)
                if (math.floor(v[1]) == math.floor(currentnpc:getXPos()) and
                    math.floor(v[2]) == math.floor(currentnpc:getYPos()) and
                    math.floor(v[3]) == math.floor(currentnpc:getZPos())) then
                        table.remove(positions,c);
                end
            end
        end
        newIndex = math.random(1,#positions)
    end

    if (newIndex == -1) then
        npc:setLocalVar("HIT_COUNT",math.random(4,6));
        npc:hideNPC(300);
        --printf("Couldn't find this mining points current index! Hiding for 5 minutes");
    else
        local position = positions[newIndex];
        npc:setLocalVar("HIT_COUNT",math.random(4,6));
        npc:hideNPC(120);
        npc:queue(3000,doMove(npc, position[1], position[2], position[3]));
    end
end;

-------------------------------------------------
-- Perform node move after queue timer depletes.
-------------------------------------------------

function doMove(npc,x,y,z,zone)
    return function(entity)
        entity:setPos(x, y, z, 0);
    end;
end;