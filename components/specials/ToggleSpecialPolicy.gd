extends Node
class_name  ToggleSpecial
## Toggle between a given new FireMode and the Weapon's original fire mode.
## Or, this can be used for other things than just fire mode.
## Simply override (in OOP terms) the functions 'override' and 'restore'

var the_original
var the_override

@onready
var toggleable := Toggle.new(_override, _restore)


func _init(o) -> void:
	set_override(o)


# Public interface
# 'execute' and 'cancel' are required for all specials.
func execute(x):
	## Take the parent object or whatever as x, and call toggle,
	## which will apply the override and the restore functions on x,
	## depending on the state of the toggle.
	toggleable.toggle([x])


func cancel(x):
	pass


# Getters and setters
func set_override(o):
	the_override = o


# Private but virtual methods
func _override(x):
	the_original = x.get_fire_mode()
	x.set_fire_mode(the_override)


func _restore(x):
	x.set_fire_mode(the_original)
