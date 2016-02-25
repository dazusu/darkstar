-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Victoire
-- @zone 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria/TextIDs");

function onTrigger(player,npc)

    player:showText(npc,CARAUTIA_SHOP_DIALOG);

    stock = {
        12432, 1450, -- Faceguard
        12464, 1936, -- Headgear
        12560, 2230, -- Scale Mail
        12592, 2745, -- Doublet
        12688, 1190, -- Scale Finger Gauntlets
        12720, 1515, -- Gloves
        12816, 1790, -- Scales Cuisses
        12848, 2110, -- Brais
        12944, 1085, -- Scale Greaves
        12976, 1410 -- Gaiters
    }

    showShop(player, SANDORIA, stock);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




