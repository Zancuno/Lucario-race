require "/scripts/util.lua"

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
		if type(config.maleFrames or config.femaleFrames) == "table" then
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
						maleFrames.body = adtpath..adtspc..imageTable[7]
						maleFrames.frontSleeve = adtpath..adtspc..imageTable[8]
						maleFrames.backSleeve = adtpath..adtspc..imageTable[4]
						femaleFrames.body = adtpath..adtspc..imageTable[6]
						femaleFrames.frontSleeve = adtpath..adtspc..imageTable[5]
						femaleFrames.backSleeve = adtpath..adtspc..imageTable[9]
					end
				else
					maleFrames.body = adtpath..adtspc.."/"..adtbdy..imageTable[7]
					maleFrames.frontSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[8]
					maleFrames.backSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[4]
					femaleFrames.body = adtpath..adtspc.."/"..adtbdy..imageTable[6]
					femaleFrames.frontSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[5]
					femaleFrames.backSleeve = adtpath..adtspc.."/"..adtbdy..imageTable[9]
				end
			else
				maleFrames.body = maleFrames.body
				maleFrames.frontSleeve = maleFrames.frontSleeve 
				maleFrames.backSleeve = maleFrames.backSleeve
				femaleFrames.body = femaleFrames.body
				femaleFrames.frontSleeve = femaleFrames.frontSleeve 
				femaleFrames.backSleeve = femaleFrames.backSleeve
			end
		end

		config.maleFrames = maleFrames
		config.femaleFrames = femaleFrames 
		end
	
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "head" then
		config = util.mergeTable({ }, config)
		local adtspc,adtbdy,adtpath = parameters.itemTags[2], parameters.itemTags[3], "/items/armors/armorAdapt/default/"
		local mask = "/items/armors/armorAdapt/"..adtspc.."/"..parameters.itemTags[5].."/"..adtbdy..imageTable[3] 
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
			if imgchk(mask)[1] <= 43 then
				config.mask = mask
			elseif imgchk(mask)[1] > 43 then
				if imgchk(adtpath..adtspc.."/"..adtbdy..imageTable[3])[1] > 43 then
					if imgchk(adtpath..adtspc..imageTable[3])[1] > 43 then
						config.mask = config.mask
					else
						config.mask = adtpath..adtspc..imageTable[3]
					end
				else
					config.mask = adtpath..adtspc.."/"..adtbdy..imageTable[3]
				end
			end
			if imgchk(maleFrames)[1] <= 64 then
				if imgchk(adtpath..adtspc.."/"..adtbdy..imageTable[2])[1] <= 64 then
					if imgchk(adtpath..adtspc..imageTable[2])[1] <=64 then
						config.maleFrames = config.maleFrames
						config.femaleFrames = config.femaleFrames
					else
						config.maleFrames = adtpath..adtspc..imageTable[2]
						config.femaleFrames = adtpath..adtspc..imageTable[1]
					end
				else
					config.maleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[2]
					config.femaleFrames = adtpath..adtspc.."/"..adtbdy..imageTable[1]
				end
			else
				config.maleFrames = maleFrames
				config.femaleFrames = femaleFrames
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
		return config, parameters
	end
end