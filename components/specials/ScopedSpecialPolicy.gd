extends ToggleSpecial
class_name ScopedSpecial

# While I love what is done here, by using the player level scope texture,
# you could also just toggle an entirely new camera scene as an override,
# which has the appropriate FOV and texture already set on it.
# Then, you don't need to toggle both those things on and off...
# Instead, all you need to do is apply the new camera
# And then you also have to affect the player movement speed though when
# you have done this.


var res = preload("res://components/cameras/scope.tscn")

# the reason for this is so that the call to ScopedSpecial.new()
# in the config file does not complain about a missing constructor
# argument, and I want to keep the parent (ToggleSpecial) constructor
# clean
# kinda dirty hack right now but I guess the real solution  is to
# actually make the scoped special take the object at construction
# instead of preloading it like I am for testing it here.
func _init(o=null) -> void:
	pass


func cancel(x):
	_restore(x)


func _override(player):
	var inst = res.instantiate()
	the_original = player.get_camera()
	player.set_camera(inst)
	# player.set_movement(SLOW)


func _restore(player):
	player.set_camera(the_original)
	# player.set_movement(NORMAL)

