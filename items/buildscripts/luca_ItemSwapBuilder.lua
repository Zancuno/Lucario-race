require "/scripts/actions/world.lua"
function build(directory, config, parameters, level, seed)
	if config.itemName == "lucariotier4chestN" then
		world.spawnItem("lucariotier4chest", mcontroller.position(), 1)
		item.consume(1)
	end
	return config, parameters
end