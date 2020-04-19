local species = player.species()
local lucario = species == "lucario"
local avali = species == "avali"

local function addItem(list, item, idSet)
  if item.bodyType == "PLSDONT" then
    --sb.logInfo("addItem PLSDONT %s%s %s", item.path, item.fileName, item.shortdescription)
    return
  end
  if not item.bodyType or (lucario and idSet[item.bodyType]) or (avali and item.bodyType == "GLU") then
    --sb.logInfo("addItem   ADDED %s", item.bodyType)
    table.insert(list, item)
    return
  end
  --sb.logInfo("addItem SKIPPED %s", item.bodyType)
end

local function addItems(list, items, idSet)
  for _,item in ipairs(items) do addItem(list, item, idSet) end
end

local items = root.assetJson("/wardrobe/lucario.json")
local portrait = world.entityPortrait(player.id(), "full")
local backArm = portrait[1].image:lower()

local gender = not not (backArm:find("b1ffa7=00000000")) -- false: neutral
local bodySpike = not not (backArm:find("eddfd4=ffffff") or backArm:find("eddfd4=000000"))
local pawSpike = not not (backArm:find("ffb34a=fefefe"))
local megaPaw = not (backArm:find("ff0011=5a5a5a"))
local tail = backArm:find("42217b=00000000") and 1 -- Lucario
              or backArm:find("748db8=00000000") and 2 -- Riolu
              or backArm:find("6b5b88=00000000") and 3 -- Fluffy
              or 0 -- Unknown
              
local idChest =
  (gender and "GC" or "NC") ..
  (bodySpike and "" or "NS") ..
  (pawSpike and "" or "NPS") ..
  "U"
local idLegs = 
  (gender and "GL" or "NL") ..
  "U"
local idTail =
  (tail == 1 and "LT" or tail == 2 and "RT" or "FT") ..
  "U" ..
  (gender and "" or "N")

local idSet = { [idChest] = true, [idLegs] = true, [idTail] = true }

--sb.logInfo("addItems %s", idSet)

import.head = {}
import.chest = {}
import.legs = {}
import.back = {}

addItems(import.head, items.head, idSet)
if lucario then addItems(import.chest, items.chest, idSet) end
if lucario or avali then addItems(import.legs, items.legs, idSet) end
addItems(import.back, items.back, idSet)
