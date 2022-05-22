require "/scripts/util.lua"

armorAdabtBuilderVersion = 5

function build(directory, config, parameters, level, seed)
	local imgchk = root.imageSize
	local imageTable = {"/headf.png", "/headm.png", "/mask.png", "/bsleeve.png", "/bsleevef.png", "/chestf.png", "/chestm.png", "/fsleeve.png", "/fsleevef.png", "/pantsf.png", "/pantsm.png", "/back.png"}
	armorAdaptCheck = root.assetJson("/cinematics/apex/intro.cinematic.disabled:muteMusic")
	if armorAdaptCheck == false then
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "chest" then
		config = util.mergeTable({ }, config)
		local adtspc,adtbdy,adtpath = parameters.itemTags[2], parameters.itemTags[3], "/items/armors/armorAdapt/default/"
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
		if string.find(maleFrames.body, "/") and parameters.itemTags[5] ~= nil then
		else
			maleFrames.body = "/assetmissing.png"
		end
			if imgchk(maleFrames.body)[1] <= 64 then
				if imgchk(adtpath..adtspc.."/"..adtbdy..imageTable[7])[1] <= 64 then
					if imgchk(adtpath..adtspc..imageTable[7])[1] <=64 then
						config.maleFrames.body = config.maleFrames.body
						config.maleFrames.frontSleeve = config.maleFrames.frontSleeve
						config.maleFrames.backSleeve = config.maleFrames.backSleeve
						config.femaleFrames.body = config.femaleFrames.body
						config.femaleFrames.frontSleeve = config.femaleFrames.frontSleeve
						config.femaleFrames.backSleeve = config.femaleFrames.backSleeve
					else
						config.maleFrames.body = adtpath..adtspc..imageTable[7]
						config.maleFrames.frontSleeve = adtpath..adtspc..imageTable[8]
						config.maleFrames.backSleeve = adtpath..adtspc..imageTable[4]
						config.femaleFrames.body = adtpath..adtspc..imageTable[6]
						config.femaleFrames.frontSleeve = adtpath..adtspc..imageTable[9]
						config.femaleFrames.backSleeve = adtpath..adtspc..imageTable[5]
					end
				else
					config.maleFrames.body = adtpath..adtspc.."/"..adtbdy..imageTable[7]
					config.maleFrames.frontSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[8]
					config.maleFrames.backSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[4]
					config.femaleFrames.body = adtpath..adtspc.."/"..adtbdy..imageTable[6]
					config.femaleFrames.frontSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[9]
					config.femaleFrames.backSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[5]
				end
			else
				config.maleFrames.body = maleFrames.body
				config.maleFrames.frontSleeve = maleFrames.frontSleeve 
				config.maleFrames.backSleeve = maleFrames.backSleeve
				config.femaleFrames.body = femaleFrames.body
				config.femaleFrames.frontSleeve = femaleFrames.frontSleeve 
				config.femaleFrames.backSleeve = femaleFrames.backSleeve
			end

		end
	
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "head" then
		config = util.mergeTable({ }, config)
		local adtspc,adtbdy,adtpath = parameters.itemTags[2], parameters.itemTags[3], "/items/armors/armorAdapt/default/"
		local mask = "/items/armors/armorAdapt/"..adtspc.."/"..parameters.itemTags[5].."/"..adtbdy..imageTable[3] 
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
			if imgchk(maleFrames)[1] <= 64 then
				if imgchk(adtpath..adtspc.."/"..adtbdy..imageTable[2])[1] <= 64 then
					if imgchk(adtpath..adtspc..imageTable[2])[1] <=64 then
						config.maleFrames = config.maleFrames
						config.femaleFrames = config.femaleFrames
						parameters.mask = config.mask
					else
						config.maleFrames = adtpath..adtspc..imageTable[2]
						config.femaleFrames = adtpath..adtspc..imageTable[1]
						parameters.mask = adtpath..adtspc..imageTable[3]
					end
				else
					config.maleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[2]
					config.femaleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[1]
					parameters.mask = adtpath..adtspc.."/"..adtbdy..imageTable[3]
				end
			else
				config.maleFrames = maleFrames
				config.femaleFrames = femaleFrames
				parameters.mask = mask
			end
		end
		
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "pants" then
		config = util.mergeTable({ }, config)
		local adtspc,adtbdy,adtpath = parameters.itemTags[2], parameters.itemTags[3], "/items/armors/armorAdapt/default/"
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
			if parameters.itemTags ~= nil and parameters.itemTags[5] ~= nil and parameters.itemTags[5] == "hideBody" then
				config.hideBody = true
			end
			if imgchk(maleFrames)[1] <= 64 then
				if imgchk(adtpath..adtspc.."/"..adtbdy..imageTable[11])[1] <= 64 then
					if imgchk(adtpath..adtspc..imageTable[11])[1] <=64 then
						config.maleFrames = config.maleFrames
						config.femaleFrames = config.femaleFrames
					else
						config.maleFrames = adtpath..adtspc..imageTable[11]
						config.femaleFrames = adtpath..adtspc..imageTable[10]
					end
				else
					config.maleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[11]
					config.femaleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[10]
				end
			else
				config.maleFrames = maleFrames
				config.femaleFrames = femaleFrames
			end
		end
		
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "back" then
		config = util.mergeTable({ }, config)
		local adtspc,adtbdy,adtpath = parameters.itemTags[2], parameters.itemTags[3], "/items/armors/armorAdapt/default/"
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
			if imgchk(maleFrames)[1] <= 64 then
				if imgchk(adtpath..adtspc.."/"..adtbdy..imageTable[12])[1] <= 64 then
					if imgchk(adtpath..adtspc..imageTable[12])[1] <=64 then
						config.maleFrames = config.maleFrames
						config.femaleFrames = config.femaleFrames
					else
						config.maleFrames = adtpath..adtspc..imageTable[12]
						config.femaleFrames = adtpath..adtspc..imageTable[12]
					end
				else
					config.maleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[12]
					config.femaleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[12]
				end
			else
				config.maleFrames = maleFrames
				config.femaleFrames = femaleFrames
			end
		end
		return config, parameters

	else
		config = config
		parameters.mask = config.mask
		return config, parameters
	end
end