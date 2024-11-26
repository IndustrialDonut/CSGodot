extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(Input.is_action_pressed("left"))
	print(Input.is_action_pressed("control"))
	#print(Input.is_action_pressed("sprint"))
	#print(Input.is_action_pressed("ui_accept"))
