function init()
	--sets what particles are added to the sides of the bound box
	animator.setParticleEmitterOffsetRegion("sparks", mcontroller.boundBox())
	--turns on the particles
	animator.setParticleEmitterActive("sparks", true)
	--sets overlay color of sprite for when effect is active
	effect.setParentDirectives("fade=60f2ff=0.25")
	
	script.setUpdateDelta(5)
	
	self.tickDamagePercentage = 0.020
	self.tickTime = 1.0
	self.tickTimer = self.tickTime
	--health of entity
	self.HP = status.resource("health")
	
	--spawns essence of aura if entity dies, will not work while damage tick is active
	if self.HP < 1 then
		world.spawnItem("eaura", world.entityPosition(entity.id()), 1)
	end
end

function update(dt)
	self.tickTimer = self.tickTimer - dt
	--causes damage over time if the enemy survives initial attack
	if self.tickTimer <= 0 then
		self.tickTimer = self.tickTime
		status.applySelfDamageRequest({
			damageType = "IgnoresDef",
			damage =  4,
			damageSourceKind = "electric",
			sourceEntitiId = entity.id()
		})
		
		--world.spawnItem("eaura", world.entityPosition(entity.id()), 1) activate if wanting consistant drops
	end
	
end

function  uninit()

end
