local baseInit = init or function() end
local baseUpdate = update or function() end


function init()
baseInit()

species = player.species()
armorAdaptCheck = root.assetJson("/cinematics/apex/intro.cinematic.disabled:muteMusic")
played = 0
end

function update(dt)
baseUpdate(dt)

if species == "lucario" and armorAdaptCheck == true and played == 0 then
	world.sendEntityMessage(entity.id(),"queueRadioMessage","lucarioArmorAdapt")
	played = 1
end


end