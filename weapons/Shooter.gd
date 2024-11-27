extends Node3D


## Different implementations for normal raycast, physical projectile,
## and shotgun bursts, and possibly knives..
## Use Composite pattern for Shotgun!
##
## Collision mask important!
## Collides with Areas!

var ammo : ReloadMode

func shoot():
	# fire hitscan or projectile
	
	if ammo.can_shoot():
		ammo.decrement_ammunition()
		
		var collider = $RayCast3D.get_collider()
		if collider:
			collider.damage()
			#print(collider)
			#print("Dama")
		# play sound effect
		# play light effect
		# emit position on minimap according to noise
