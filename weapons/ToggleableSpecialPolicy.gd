extends Node
## Toggle between a given new FireMode and the Weapon's original fire mode.

var fire_mode : FireMode
var fire_mode_override : FireMode

@onready
var toggleable := Toggle.new(_override_fire_mode, _restore_fire_mode)


func _init(f: FireMode) -> void:
	set_toggleable_firemode(f)


# Public interface
func execute(weapon : Weapon):
	toggleable.toggle([weapon])


# Getters and setters
func set_toggleable_firemode(f : FireMode):
	fire_mode_override = f


# Private methods
func _override_fire_mode(weapon : Weapon):
	fire_mode = weapon.get_fire_mode()
	weapon.set_fire_mode(fire_mode_override)


func _restore_fire_mode(weapon : Weapon):
	weapon.set_fire_mode(fire_mode)
