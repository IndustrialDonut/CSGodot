extends Node
class_name  ToggleableSpecial
## Toggle between a given new FireMode and the Weapon's original fire mode.

var fire_mode
var fire_mode_override

@onready
var toggleable := Toggle.new(_override_fire_mode, _restore_fire_mode)


func _init(f) -> void:
	set_toggleable_firemode(f)


# Public interface
func execute(x):
	toggleable.toggle([x])


func cancel(x):
	pass # firemode should persist after weapon switch.


# Getters and setters
func set_toggleable_firemode(f):
	fire_mode_override = f


# Private methods
func _override_fire_mode(x):
	fire_mode = x.get_fire_mode()
	x.set_fire_mode(fire_mode_override)


func _restore_fire_mode(x):
	x.set_fire_mode(fire_mode)
