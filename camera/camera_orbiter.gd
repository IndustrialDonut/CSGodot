extends Node3D

@export var distance = 2.0
var sens = 0.01

func _ready() -> void:
	$HBase/VBase/Camera3D.position.z = distance


func _input(event: InputEvent) -> void:
	
	if Input.is_action_pressed("rmb"):
		return
	
	if event is InputEventMouseMotion:
		$HBase.rotate_y(-event.relative.x * sens)
		$HBase/VBase.rotate_x(-event.relative.y * sens)
	

func _process(delta: float) -> void:
	if Input.is_action_just_released("zoom_in"):
		$HBase/VBase/Camera3D.translate_object_local(Vector3.FORWARD * delta * 2)
	elif Input.is_action_just_released("zoom_out"):
		$HBase/VBase/Camera3D.translate_object_local(-Vector3.FORWARD * delta * 2)
