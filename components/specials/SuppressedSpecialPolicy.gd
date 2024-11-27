extends Node

var original_shootable : Node
var suppressed_shootable : Node

@onready
var toggleable := Toggle.new(_attach_suppressor, _detach_suppressor)


# Public interface
func execute(x):
	#var weapon = get_parent()
	toggleable.toggle([x])


# Getters and setters
func set_suppressor(suppressed_shootable):
	suppressed_shootable = suppressed_shootable


# Private methods
func _attach_suppressor(weapon):
	original_shootable = weapon.get_shootable()
	weapon.set_shootable(suppressed_shootable)


func _detach_suppressor(weapon ):
	weapon.set_shootable(original_shootable)
