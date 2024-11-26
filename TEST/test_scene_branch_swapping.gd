extends Node3D


var old : Node
@onready
var override : Node = load('res://addons/test_world.tscn').instantiate()
var is_swapped := false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("save"):
		swap()
		print($Node3D.get_child(0).owner)


func swap():
	if not is_swapped:
		old = $Node3D/SomeBranch
		printerr(old.owner)
		$Node3D.remove_child(old)
		
		$Node3D.add_child(override)
		override.owner = $Node3D
	else:
		$Node3D.remove_child(override)
		$Node3D.add_child(old)
		
		# The owner property IS CLEARED upon removal from the scene tree.
		# YOU must make sure to set it again when you add the branch back!
		old.owner = $Node3D
	
	is_swapped = not is_swapped
