extends Area3D


var health = 100


func _ready() -> void:
	_update()


func damage():
	health -= 17
	_update()


func _update():
	$Label3D.text = "%d" % int(health)
