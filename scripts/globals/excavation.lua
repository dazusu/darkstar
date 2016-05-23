local excavationpoints = {
	[198] = {17588770,17588771,17588772,17588773,17588774,17588775},
	[173] = {17486249,17486250,17486251,17486252,17486253,17486254},
	[117] = {17257051,17257052,17257053,17257054,17257055,17257056},
	[7] = {16806365,16806366,16806367,16806368,16806369,16806370}
}

local coordinates = {
	[198] = {
		{-155.009,-0.792,30.124},   -- Zone: Maze_of_Shakhrami
		{-102.587,-1.213,-32.709},   -- Zone: Maze_of_Shakhrami
		{-36.867,-5.262,12.651},   -- Zone: Maze_of_Shakhrami
		{253.463,-1.082,-143.664},   -- Zone: Maze_of_Shakhrami
		{255.678,-0.45,-167.703},   -- Zone: Maze_of_Shakhrami
		{121.042,0.49,68.333},   -- Zone: Maze_of_Shakhrami
		{234.243,-0.979,33.365},   -- Zone: Maze_of_Shakhrami
		{401.586,-0.775,-48.286},   -- Zone: Maze_of_Shakhrami
		{411.013,-0.661,-72.948}   -- Zone: Maze_of_Shakhrami
	},
	[117] = {
		{390.239,45.822,518.367},   -- Zone: Tahrongi_Canyon
		{423.889,47.61,486.256},   -- Zone: Tahrongi_Canyon
		{-392.098,15.729,425.209},   -- Zone: Tahrongi_Canyon
		{-386.953,15.773,401.107},   -- Zone: Tahrongi_Canyon
		{-406.89,15.332,404.831},   -- Zone: Tahrongi_Canyon
		{-426.107,16.004,402.495},   -- Zone: Tahrongi_Canyon
		{-439.896,15.164,410.594},   -- Zone: Tahrongi_Canyon
		{199.344,10.479,97.462},   -- Zone: Tahrongi_Canyon
		{188.92,6.369,64.013},   -- Zone: Tahrongi_Canyon
		{216.953,6.9,63.775},   -- Zone: Tahrongi_Canyon
		{-253.579,9.799,-520.288},   -- Zone: Tahrongi_Canyon
		{-262.048,13.478,-538.125},   -- Zone: Tahrongi_Canyon
		{-246.53,16.164,-577.336}   -- Zone: Tahrongi_Canyon
	}
}

local extracted = {
    [7] = { -- Attohwa Chasm
        {1000,880}, -- Bone Chip (Common)
        {1000,898}, -- Chicken Bone (Common)
        {500,891}, -- Bat Fang (Uncommon)
        {500,17396}, -- Little Worm (Uncommon)
        {250,897}, -- Scorpion Claw (Rare)
        {250,896}, -- Scorpion Shell (Rare)
        {50,1616}, -- Antlion Jaw (Very Rare)
        {50,1236}, -- Cactus Stems (Very Rare)
        {50,1473}, -- High Quality Scorpion Shell (Very Rare)
        {50,769}, -- Colored Rocks (Very Rare)       
    },
    [198] = { -- Maze of Shakhrami
        {1000,880}, -- Bone Chip (Common)
        {1000,891}, -- Bat Fang (Common)
        {1000,17396}, -- Little Worm (Common)
        {250,893}, -- Giant Femur (Rare)
        {250,897}, -- Scorpion Claw (Rare)
        {250,896}, -- Scorpion Shell (Rare)
        {250,703}, -- Petrified Log (Rare)
        {50,769}, -- Colored Rocks (Very Rare)
        {50,1888}, -- Silica (Very Rare)
        {50,1159}, -- Wyvern Egg (QUEST ITEM)             
    },
    [173] = { -- Korroloka Tunnel
        {1000,936}, -- Rock Salt (Common)
        {500,888}, -- Seashell (Uncommon)
        {50,881}, -- Crab Shell (Very Rare)
        {500,864}, -- Fish Scales (Uncommon)
        {1000,17395}, -- Lugworm (Common)
        {250,17397}, -- Shell Bug (Rare)
        {250,887}, -- Coral Fragment (Rare)
        {50,573}, -- Vegetable Seeds (Very Rare)
        {50,885}, -- Turtle Shell (Very Rare)
        {50,575}, -- Grain Seeds (Very Rare)
        {250,1985}, -- Helmet Mole (Rare)
        {50,1838}, -- Bal Shell (QUEST ITEM)             
    },
    [117] = { -- Tahrongi Canyon
        {1000,880}, -- Bone Chip (Common)
        {1000,898}, -- Chicken Bone (Common)
        {500,891}, -- Bat Fang (Uncommon)
        {500,893}, -- Giant Femur (Uncommon)
        {500,17396}, -- Little Worm (Uncommon)
        {50,897}, -- Scorpion Claw (Very Rare)
        {50,896}, -- Scorpion Shell (Very Rare)
        {50,885}, -- Turtle Shell (Very Rare)
        {50,1888}, -- Silica (Very Rare)     
    },
}

local rocks = {0x0301,0x0302,0x0303,0x0304,0x0305,0x0306,0x0308,0x0307};


function startExcavation(player, zone, npc, trade, cutsceneId)

    -- Check that the user has a pickaxe, and has traded a single one.
    if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then
        local broken = pickaxeBreak(player,trade);
        local item = getExcavationItem(player,zone);
        local full = (player:getFreeSlotsCount() == 0 and 1 or 0);
        local hitCount = npc:getLocalVar("HIT_COUNT") - 1;
        --printf("Mining: full: %s, item: %s, hitCount: %s, id: %s", full, item, hitCount, npc);
        if (item ~= 0) then
            if (hitCount == -1) then -- hits will only ever be -1 after a server reset.
                hitCount = math.random(4,5);
            end
            if (hitCount == 0) then
                moveExcavationPoint(player,npc,zone);
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

function pickaxeBreak(player,trade)
    local broken = 0;
    if (math.random(0,100) <= EXCAVATION_BREAK_CHANCE) then
        broken = 1;
        player:tradeComplete();
    end;
    return broken;
end;
-------


function getExcavationItem(player,zone) 
    -- declare the winning item!
    local item = 0;
    if (math.random(0,100) >= EXCAVATION_RATE) then
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



function moveExcavationPoint(player,npc,zone)

    local positions = utils.shuffle(coordinates[zone]);
    local points = excavationpoints[zone];
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
