
function init()
	animator.setGlobalTag("species", storage.species or "human")
	animator.setGlobalTag("bodyType", idChest or idLegs or idTail or "default")

	if player.species() == "lucario" then
		local portrait = world.entityPortrait(player.id(), "full")
		local backArm = portrait[1].image:lower()
    
		-- Find body type
		local gender = not not (backArm:find("b1ffa7=00000000")) -- false: neutral
		local bodySpike = not not (backArm:find("eddfd4=ffffff") or backArm:find("eddfd4=000000"))
		local pawSpike = not not (backArm:find("ffb34a=fefefe"))
		local megaPaw = not (backArm:find("ff0011=5a5a5a"))
		local tail = backArm:find("42217b=00000000") and "L" -- Lucario
					or backArm:find("748db8=00000000") and "R" -- Riolu
					or backArm:find("6b5b88=00000000") and "F" -- Fluffy
		local appendage = not not (backArm:find("9cfcff=00000000")) -- false: A
                  

		local idChest =
			(gender and "GC" or "NC") ..
			(bodySpike and "" or "NS") ..
			(pawSpike and "" or "NPS") ..
			"U"
		local idLegs = 
			(gender and "GL" or "NL") ..
			"U"
		local idTail =
			(tail .. "T") ..
			"U" ..
			(gender and "" or "N") ..
			(appendage and "" or "A")
      
		sb.logInfo("Lucario: Detected body type %s %s %s", idChest, idLegs, idTail)

	end	
end

function setSpecies(species)
	storage.species() = species
	animator.setGlobalTag("species", species)
	return true
end

function setBodyType(bodytype)
	idChest or idLegs or idTail or "default" = bodyType
	animator.setGlobalTag("bodyType", bodyType)
	return true
end