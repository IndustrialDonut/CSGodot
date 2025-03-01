class_name Toggle
extends Object

var apply : Callable
var restore : Callable
var is_toggled := false

func _init(apply : Callable, restore : Callable):
	self.apply = apply
	self.restore = restore

func toggle(arg_array : Array = []):
	if not is_toggled:
		apply.callv(arg_array)
	else:
		restore.callv(arg_array)
	is_toggled = not is_toggled


# func reset():
# reset the toggle back to the starting position but without applying
# or restoring anything
# just set 'is_toggled' to false , I guess
