require "/scripts/util.lua"

function build(directory, config, parameters, level, seed)
	armorAdaptCheck = root.assetJson("/cinematics/apex/intro.cinematic.disabled:muteMusic")
	if armorAdaptCheck == false then
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "chest" then
		config = util.mergeTable({ }, config)
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames


		if type(config.maleFrames or config.femaleFrames) == "table" then
			if root.imageSize(maleFrames.body)[1] <= 64 then
				if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/%s/chestm.png", parameters.itemTags[2], parameters.itemTags[3]))[1] <= 64 then
					if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/chestm.png", parameters.itemTags[2]))[1] <=64 then
						config.maleFrames.body = config.maleFrames.body
						config.maleFrames.frontSleeve = config.maleFrames.frontSleeve
						config.maleFrames.backSleeve = config.maleFrames.backSleeve
						config.femaleFrames.body = config.femaleFrames.body
						config.femaleFrames.frontSleeve = config.femaleFrames.frontSleeve
						config.femaleFrames.backSleeve = config.femaleFrames.backSleeve
					else
						maleFrames.body = string.format("/items/armors/armorAdapt/default/%s/chestm.png", parameters.itemTags[2])
						maleFrames.frontSleeve = string.format("/items/armors/armorAdapt/default/%s/fsleeve.png", parameters.itemTags[2])
						maleFrames.backSleeve = string.format("/items/armors/armorAdapt/default/%s/bsleeve.png", parameters.itemTags[2])
						femaleFrames.body = string.format("/items/armors/armorAdapt/default/%s/chestf.png", parameters.itemTags[2])
						femaleFrames.frontSleeve = string.format("/items/armors/armorAdapt/default/%s/fsleeve.png", parameters.itemTags[2])
						femaleFrames.backSleeve = string.format("/items/armors/armorAdapt/default/%s/bsleeve.png", parameters.itemTags[2])
					end
				else	
					maleFrames.body = string.format("/items/armors/armorAdapt/default/%s/%s/chestm.png", parameters.itemTags[2], parameters.itemTags[3])
					maleFrames.frontSleeve = string.format("/items/armors/armorAdapt/default/%s/%s/fsleeve.png", parameters.itemTags[2], parameters.itemTags[3])
					maleFrames.backSleeve = string.format("/items/armors/armorAdapt/default/%s/%s/bsleeve.png", parameters.itemTags[2], parameters.itemTags[3])
					femaleFrames.body = string.format("/items/armors/armorAdapt/default/%s/%s/chestf.png", parameters.itemTags[2], parameters.itemTags[3])
					femaleFrames.frontSleeve = string.format("/items/armors/armorAdapt/default/%s/%s/fsleeve.png", parameters.itemTags[2], parameters.itemTags[3])
					femaleFrames.backSleeve = string.format("/items/armors/armorAdapt/default/%s/%s/bsleeve.png", parameters.itemTags[2], parameters.itemTags[3])
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
		local mask = parameters.mask 
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
			if root.imageSize(mask)[1] <= 43 then
				config.mask = mask
			elseif root.imageSize(mask)[1] > 43 then
				if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/%s/mask.png", parameters.itemTags[2], parameters.itemTags[3]))[1] > 43 then
					if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/mask.png", parameters.itemTags[2]))[1] > 43 then
						config.mask = config.mask
					else
						config.mask = string.format("/items/armors/armorAdapt/default/%s/mask.png", parameters.itemTags[2])
					end
				else
					config.mask = string.format("/items/armors/armorAdapt/default/%s/%s/mask.png", parameters.itemTags[2], parameters.itemTags[3])
				end
			end
			if root.imageSize(maleFrames)[1] <= 64 then
				if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/%s/head.png", parameters.itemTags[2], parameters.itemTags[3]))[1] <= 64 then
					if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/head.png", parameters.itemTags[2]))[1] <= 64 then
						config.maleFrames = config.maleFrames
						config.femaleFrames = config.femaleFrames
					else
						config.maleFrames = string.format("/items/armors/armorAdapt/default/%s/head.png", parameters.itemTags[2])
						config.femaleFrames = string.format("/items/armors/armorAdapt/default/%s/head.png", parameters.itemTags[2])
					end
				else
					config.maleFrames = string.format("/items/armors/armorAdapt/default/%s/%s/head.png", parameters.itemTags[2], parameters.itemTags[3])
					config.femaleFrames = string.format("/items/armors/armorAdapt/default/%s/%s/head.png", parameters.itemTags[2], parameters.itemTags[3])
				end
			else
				config.maleFrames = maleFrames
				config.femaleFrames = femaleFrames
			end
		end
		
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "pants" then
		config = util.mergeTable({ }, config)
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
			if parameters.itemTags ~= nil and parameters.itemTags[5] ~= nil and parameters.itemTags[5] == "hideBody" then
				config.hideBody = true
			end
			if root.imageSize(maleFrames)[1] <= 64 then
				if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/%s/pantsm.png", parameters.itemTags[2], parameters.itemTags[3]))[1] <= 64 then
					if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/pantsm.png", parameters.itemTags[2]))[1] <= 64 then
						config.maleFrames = config.maleFrames
						config.femaleFrames = config.femaleFrames
					else
						config.maleFrames = string.format("/items/armors/armorAdapt/default/%s/pantsm.png", parameters.itemTags[2])
						config.femaleFrames = string.format("/items/armors/armorAdapt/default/%s/pantsf.png", parameters.itemTags[2])
					end
				else
					config.maleFrames = string.format("/items/armors/armorAdapt/default/%s/%s/pantsm.png", parameters.itemTags[2], parameters.itemTags[3])
					config.femaleFrames = string.format("/items/armors/armorAdapt/default/%s/%s/pantsf.png", parameters.itemTags[2], parameters.itemTags[3])
				end
			else
				config.maleFrames = maleFrames
				config.femaleFrames = femaleFrames
			end
		end
		
		if parameters.itemTags ~= nil and parameters.itemTags[4] == "back" then
		config = util.mergeTable({ }, config)
		local maleFrames = parameters.maleFrames
		local femaleFrames = parameters.femaleFrames
			if root.imageSize(maleFrames)[1] <= 64 then
				if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/%s/back.png", parameters.itemTags[2], parameters.itemTags[3]))[1] <= 64 then
					if root.imageSize(string.format("/items/armors/armorAdapt/default/%s/back.png", parameters.itemTags[2]))[1] <= 64 then
						config.maleFrames = config.maleFrames
						config.femaleFrames = config.femaleFrames
					else
						config.maleFrames = string.format("/items/armors/armorAdapt/default/%s/back.png", parameters.itemTags[2])
						config.femaleFrames = string.format("/items/armors/armorAdapt/default/%s/back.png", parameters.itemTags[2])
					end
				else
					config.maleFrames = string.format("/items/armors/armorAdapt/default/%s/%s/back.png", parameters.itemTags[2], parameters.itemTags[3])
					config.femaleFrames = string.format("/items/armors/armorAdapt/default/%s/%s/back.png", parameters.itemTags[2], parameters.itemTags[3])
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