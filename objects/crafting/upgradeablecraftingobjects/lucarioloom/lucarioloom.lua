require "/scripts/vec2.lua"
require "/scripts/util.lua"
require "/scripts/interp.lua"

function init()
	sb.logInfo("Testing if script is running.")
	script.setUpdateDelta(100)
end

function update(dt)
	sb.logInfo("testing if script is updating.")
end