extends ToggleSpecial
class_name SuppressedSpecial

# Construct with the overriding object (the desired suppressor)

# You can override the constructor to make it static what type you can 
# / should take as the overriding object type, since this will affect
# what happens later when actually applied to the player or weapon.
#func _init(o : Toggle) -> void:
	#self.set_override(o)

# Then, by changing the behavior of _override and _restore
# We will now override the SHOOTABLE on the weapon or player.
func _override(x):
	the_original = x.get_shootable()
	x.set_shootable(the_override)


func _restore(x):
	x.set_shootable(the_original)
