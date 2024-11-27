extends Node
class_name ScopedSpecial

var t = Toggle.new(_apply, _remove)
var old_fov : float

# Public interface
func execute(x):
	t.toggle([x])


func cancel(x):
	_remove(x)


func _apply(player):
	player.show_scope()
	old_fov = player.get_fov()
	player.set_fov(45)


func _remove(player):
	player.hide_scope()
	if old_fov:
		player.set_fov(old_fov)

