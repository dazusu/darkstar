--local harvestingpoints = {51, {16986721,16986722,16986723,16986724,16986725,16986726},  -- Wajaom Woodlands
  --             52, {16990603,16990604,16990605,16990606,16990607,16990608},  -- Bhaflau Thickets
    --           89, {17142545,17142546,17142547,17142548,17142549,17142550},  -- Grauberg [S]
      --         95, {17167162,17167163,17167164,17167165,17167166,17167167},  -- West Sarutabaruta [S]
        --       115,{17248868,17248869,17248870,17248871,17248872,17248873},  -- West Sarutabaruta
--               123,{17281632,17281633,17281634},                             -- Yuhtunga Jungle
  --             124,{17285677,17285678,17285679},                             -- Yhoator Jungle
    --           145,{17371605,17371606,17371607,17371608,17371609,17371610},  -- Giddeus
      --         254,{17818220,17818221,17818222,17818223,17818224,17818225}
--}; -- Abyssea - Grauberg

local harvestingpoints = {
    [51] = {}, -- Wajaom Woodlands
    [52] = {}, -- Bhaflau Thickets
    [115] = {17248868,17248869,17248870,17248871,17248872,17248873}, -- West Sarutabaruta
    [145] = {17371605,17371606,17371607,17371608,17371609,17371610}, -- Giddeus
    [123] = {17281632,17281633,17281634}, -- Yuhtunga Jungle
    [124] = {17285677,17285678,17285679} -- Yhoator Jungle
}


local coordinates = {
    [123] = {
        {-340.141,-1.725,-22.031},-- Zone: Yuhtunga_Jungle
        {-284.202,10.432,-11.556},-- Zone: Yuhtunga_Jungle
        {-178.785,0.342,-158.821},-- Zone: Yuhtunga_Jungle
        {-181.856,0.321,-204.361},-- Zone: Yuhtunga_Jungle
        {-226.211,3.142,-142.806},-- Zone: Yuhtunga_Jungle
        {-205.396,0.833,-217.628},-- Zone: Yuhtunga_Jungle
        {-481.088,0.289,181.635},-- Zone: Yuhtunga_Jungle
        {-524.606,0.135,176.846},-- Zone: Yuhtunga_Jungle
        {-494.037,1.137,221.738},-- Zone: Yuhtunga_Jungle
        {-47.849,0.112,-420.135},-- Zone: Yuhtunga_Jungle
        {-38.762,0.249,-461.968},-- Zone: Yuhtunga_Jungle
        {17.741,4.307,-500.123},-- Zone: Yuhtunga_Jungle
    },
	[115] = {
        {-381.536,-17.04,309},-- Zone: Sarutabaruta_West
        {-396.289,-16,316.152},-- Zone: Sarutabaruta_West
        {-383.971,-18.059,334.579},-- Zone: Sarutabaruta_West
        {-436.832,-29.035,343.469},-- Zone: Sarutabaruta_West
        {-366.422,-16.797,388.2},-- Zone: Sarutabaruta_West
        {-317.449,-16.15,393.626},-- Zone: Sarutabaruta_West
        {-197.144,-16.251,365.954},-- Zone: Sarutabaruta_West
        {-149.327,-16.873,393.068},-- Zone: Sarutabaruta_West
        {-103.005,-17.469,383.478},-- Zone: Sarutabaruta_West
        {-81.529,-16,396.787},-- Zone: Sarutabaruta_West
        {-39.898,-9.034,136.514},-- Zone: Sarutabaruta_West
        {-80.453,-16.019,44.093},-- Zone: Sarutabaruta_West
        {-41.083,-16.11,-4.369},-- Zone: Sarutabaruta_West
        {-84.158,-16.444,-50.426},-- Zone: Sarutabaruta_West
        {-158.349,-16,-81.425},-- Zone: Sarutabaruta_West
        {-180.715,-19.105,-105.567}-- Zone: Sarutabaruta_West
    	},
	[145] = {
        {-115.25,0.979,-254.747},-- Zone: Giddeus
        {-151.178,1.03,-255.137},-- Zone: Giddeus
        {-173.23,1.054,-244.347},-- Zone: Giddeus
        {-146.677,0.836,-225.508},-- Zone: Giddeus
        {-129.763,0.995,-224.298},-- Zone: Giddeus
        {-119.313,1,-225.957},-- Zone: Giddeus
        {-83.227,0.454,-172.149},-- Zone: Giddeus
        {-68.463,1.107,-137.713},-- Zone: Giddeus
        {-114.022,1.16,-125.79},-- Zone: Giddeus
        {-140.835,0.89,-103.452},-- Zone: Giddeus
        {-44.526,0.555,-131.901},-- Zone: Giddeus
        {-23.939,0.994,-124.804},-- Zone: Giddeus
        {-25.861,1.019,-113.717},-- Zone: Giddeus
        {-45.917,0.525,-85.557},-- Zone: Giddeus
        {-61.976,1.034,-63.178},-- Zone: Giddeus
        {-86.977,-1.637,-95.969,},-- Zone: Giddeus
        {-44.689,0.801,-134.324},-- Zone: Giddeus
        {75.149,0.939,-195.734},-- Zone: Giddeus
        {81.393,1,-220.675},-- Zone: Giddeus
        {68.927,1.356,-215.852},-- Zone: Giddeus
        {74.477,1.039,-254.529},-- Zone: Giddeus
        {102.636,1.693,-231.035},-- Zone: Giddeus
        {106.723,0.962,-255.208},-- Zone: Giddeus
        {135.071,0.875,-234.756},-- Zone: Giddeus
        {134.41,1,-203.545},-- Zone: Giddeus
        {137.056,0.972,-189.106},-- Zone: Giddeus
        {91.767,0.23,-133.039},-- Zone: Giddeus
        {74.221,0.939,-130.227},-- Zone: Giddeus
        {85.942,0.732,-106.086},-- Zone: Giddeus
        {69.255,0.32,-85.157},-- Zone: Giddeus
        {86.479,0.902,-71.288}-- Zone: Giddeus
	}
}



local extracted = {
    [51] = { -- Wajaom Woodlands
        {1000,1522}, -- Fresh Marjoram (Common)
        {300,2236}, -- Simsim (Uncommon)
        {300,2295}, -- Mohbwa Grass (Uncommon)
        {1000,2168}, -- Pephredo Hive Chip (Common)
        {200,4388}, -- Eggplant (Rare)
        {200,2270}, -- Coffee Cherries (Rare)
        {100,2645}, -- Eastern Ginger (Very Rare)
        {200,2156}, -- Imperial Tea Leaves (Rare)
        {100,1845}, -- Red Moko Grass (Very Rare)
        {100,1524}, -- Fresh Mugwort (Very Rare)
        {100,951} -- Wijnruit (Very Rare)        
    },
    [52] = { -- Bhaflau Thickets
        {1000,2295}, -- Mohbwa Grass (Common)
		{300,1522}, -- Fresh Marjoram (Uncommon)
		{300,2164}, -- Pephredo Hive Chip (Uncommon)
        {300,2236}, -- Simsim (Uncommon)
		{300,2156}, -- Imperial Tea Leaves (Uncommon)
		{300,2270}, -- Coffee Cherries (Uncommon)
		{200,4388}, --Eggplant (Rare)
        {200,1845}, -- Red Moko Grass (Rare)
        {100,1524}, -- Fresh Mugwort (Very Rare)        
		{100,951}, -- Wijnruit (Very Rare)
        {100,2645} -- Eastern Ginger (Very Rare)
    },
    [115] = { -- West Sarutabaruta
        {1000,833}, -- Moko Grass (Common) 
		{300,834}, -- Saruta Cotton (Uncommon) 
		{300,1522}, -- Fresh Majoram (Uncommon) 
        {300,1845}, -- Red moko Grass (Uncommon) 
        {200,835}, -- Flax Flower (Rare)
		{200,2713}, -- Dyer's Woad (Rare)
		{200,4545}, -- Gysahl Greens (Rare) 
		{200,635}, -- Windurstian Tea Leaves (Rare) 
        {100,1981}, -- Skull Locust (Very Rare) 
        {100,951}, -- Winjruit (Very Rare) 
        {100,573}, -- Vegetable Seeds (Very Rare) 
        {100,572}, -- Herb Seeds (Very Rare) 
        {100,575}, -- Grain Seeds (Very Rare)
        {100,839}, -- Crawler Cocoon (Very Rare) 
        {100,1524} -- Fresh Mugwort (Very Rare) 
    },
	[145] = { -- Giddeus
        {300,1845}, -- Red moko Grass (Uncommon)
        {300,2713}, -- Dyer's Woad (Uncommon) 
        {300,835}, -- Flax Flower (Uncommon)
        {300,834}, -- Saruta Cotton (Uncommon)
        {300,1522}, -- Fresh Majoram (Uncommon) 
        {300,833}, -- Moko Grass (Uncommon)
        {200,635}, -- Windurstian Tea Leaves (Rare) 
        {200,4545}, -- Gysahl Greens (Rare) 
        {100,1982}, -- King Locust (Very Rare) 
        {100,951}, -- Winjruit (Very Rare)
        {100,573}, -- Vegetable Seeds (Very Rare)
        {100,572}, -- Herb Seeds (Very Rare)
        {100,575}, -- Grain Seeds (Very Rare)
        {100,839}, -- Crawler Cocoon (Very Rare)
        {100,1524} -- Fresh Mugwort (Very Rare)         
    },
    [123] = { -- Yuhtunga Jungle
        {1000,4373}, -- Woozyshroom (Common)
		{300,4375}, -- Danceshroom (Uncommon)
		{300,4374}, -- Sleepshroom (Uncommon)
		{200,4447}, -- Scream Fungus (Rare)
		{200,4448}, -- Puffball (Rare)
		{100,4386}, -- King Truffle (Very Rare)
		{100,1983} -- Mushroom Locust (Very Rare)
    },
    [124] = { -- Yhoator Jungle
        {1000,4373}, -- Woozyshroom (Common)
        {300,4375}, -- Danceshroom (Uncommon)
        {300,4374}, -- Sleepshroom (Uncommon)
        {200,4447}, -- Scream Fungus (Rare)
        {200,4450}, -- Coral Fungus (Rare)
		{100,4449}, -- Reishi Mushroom (Very Rare)
        {100,1983} -- Mushroom Locust (Very Rare)     
	}
}

local rocks = {0x0301,0x0302,0x0303,0x0304,0x0305,0x0306,0x0308,0x0307};


function startHarvesting(player, zone, npc, trade, cutsceneId)

    -- Check that the user has a pickaxe, and has traded a single one.
    if (trade:hasItemQty(1020,1) and trade:getItemCount() == 1) then
        local broken = sickleBreak(player,trade);
        local item = getHarvestingItem(player,zone);
        local full = (player:getFreeSlotsCount() == 0 and 1 or 0);
        local hitCount = npc:getLocalVar("HIT_COUNT") - 1;
        --printf("Mining: full: %s, item: %s, hitCount: %s, id: %s", full, item, hitCount, npc);
        if (item ~= 0) then
            if (hitCount == -1) then -- hits will only ever be -1 after a server reset.
                hitCount = math.random(4,5);
            end
            if (hitCount == 0) then
                moveHarvestingPoint(player,npc,zone);
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

function sickleBreak(player,trade)
    local broken = 0;
    if (math.random(0,100) <= HARVESTING_BREAK_CHANCE) then
        broken = 1;
        player:tradeComplete();
    end;
    return broken;
end;
-------


function getHarvestingItem(player,zone) 
    -- declare the winning item!
    local item = 0;
    if (math.random(0,100) >= HARVESTING_RATE) then
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

    -- if the item was a coloured rock, turn it into the appropriate element
    local day = VanadielDayElement();
    if (item == 769) then
        item = rocks[day+1];
    end;

    return item;
end;



function moveHarvestingPoint(player,npc,zone)

    local positions = utils.shuffle(coordinates[zone]);
    local points = harvestingpoints[zone];
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


function doMove(npc,x,y,z,zone)
    return function(entity)
        entity:setPos(x, y, z, 0);
    end;
end;
