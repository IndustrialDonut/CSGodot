extends Node3D
class_name Shooter

## Different implementations for normal raycast, physical projectile,
## and shotgun bursts, and possibly knives..
## Use Composite pattern for Shotgun!
##
## Collision mask important!
## Collides with Areas!

var ammo : ReloadMode
var eff_sound
var eff_light
var map_emitter
var emission_strength

func _init(sound="", light="", emission_strength=100):
	eff_light = sound
	eff_light = light
	self.emission_strength = emission_strength


func shoot():
	if ammo.can_shoot():
		ammo.decrement_ammunition()
		
		var collider = $RayCast3D.get_collider()
		if collider:
			collider.damage()
		
		#eff_sound.play()
		#eff_light.play()
		
		# For a fully suppressed shooter, emission strength = 0
		#map_emitter.emit(emission_strength)
