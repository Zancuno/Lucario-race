function init()
  if player.species() == "lucario" then
    local portrait = world.entityPortrait(player.id(), "full")
    local backArm = portrait[1].image:lower()
    
    -- Find body type
    local gender = not not (backArm:find("b1ffa7=00000000")) -- false: neutral
    local bodySpike = not not (backArm:find("eddfd4=ffffff") or backArm:find("eddfd4=000000"))
    local pawSpike = not not (backArm:find("ffb34a=ffffff"))
    local megaPaw = not (backArm:find("ff0011=5a5a5a"))
    local tail = backArm:find("42217b=00000000") and "L" -- Lucario
                  or backArm:find("748db8=00000000") and "R" -- Riolu
                  or backArm:find("6b5b88=00000000") and "F" -- Fluffy
                  
    --[[
    local idChest =
      (gender and "GC" or "NC") ..
      (bodySpike and "" or "NS") ..
      (pawSpike and "" or "NPS") ..
      "U"
    local idLegs = 
      (gender and "GL" or "NL") ..
      "U"
    local idTail =
      (gender and "" or "N") ..
      (tail .. "T") ..
      "U"
      
    sb.logInfo("Lucario: Detected body type %s %s %s", idChest, idLegs, idTail)
    ]]
      
    giveRecipes({
      gender = gender,
      tail = tail,
      hasBodySpike = bodySpike,
      hasPawSpike = pawSpike,
      hasMegaPaw = megaPaw
    })
  end

  quest.complete()
end

--- Unlocks the right Lucario blueprints based on the body type
-- cfg.gender: bool. True is gender, false is neutral.
-- cfg.tail: "L", "R" or "F"
-- cfg.hasBodySpike bool
-- cfg.hasPawSpike bool
-- cfg.hasMegaPaw bool
function giveRecipes(cfg)
  local items = root.assetJson("/quests/lucario/bodyType.json")
  
  -- Body & legs
  if cfg.gender then    
    -- GENDER BODY TYPE
    if cfg.hasBodySpike and cfg.hasPawSpike then
      unlockItems(items.GCU)
    elseif cfg.hasBodySpike then
      unlockItems(items.GCNPSU)
    elseif cfg.hasPawSpike then
      unlockItems(items.GCNSU)
    else
      unlockItems(items.GCNSNPSU)
    end
    unlockItems(items.GLU, "GLU")
  else    
    -- NEUTRAL BODY TYPE
    if cfg.hasBodySpike and cfg.hasPawSpike then
      -- Paw spike and body spike
      unlockItems(items.NCU)
    elseif cfg.hasBodySpike then
      -- No paw spike
      unlockItems(items.NCNPSU)
    elseif cfg.hasPawSpike then
      -- No body spike
      unlockItems(items.NCNSU)
    else
      -- No paw spike no body spike
      unlockItems(items.NCNSNPSU)
    end
    -- Neutral legs
    unlockItems(items.NLU)
  end
  
  -- Tail
  local tail = cfg.tail .. "TU"
  if not cfg.gender then tail = tail .. "N" end
  unlockItems(items[tail], tail)
end

function unlockItems(items)
  for _,item in pairs(items) do
    player.giveBlueprint(item)
  end
end