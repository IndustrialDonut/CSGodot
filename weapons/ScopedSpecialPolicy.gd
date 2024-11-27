extends Node
class_name ScopedSpecial

var t = Toggle.new(_apply, _remove)

# Public interface
func execute(x):
	t.toggle([x])


func _apply(player):
	player.show_scope()
	get_tree().root.get_camera_3d().fov = 45


func _remove(player):
	player.hide_scope()
	get_tree().root.get_camera_3d().fov = 75

