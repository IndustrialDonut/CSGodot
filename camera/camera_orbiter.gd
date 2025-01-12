extends Node3D

@export var default_zoom = 4.0 # default units back from center point
@export var mouse_sensitivity = 0.01
@export var scroll_sensitivity = 1 # how many chunks to move per scroll

func _ready() -> void:
	$VBase/Camera3D.position.z = default_zoom


func _input(event: InputEvent) -> void:
	
	if Input.is_action_pressed("rmb"):
		return
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$VBase.rotate_x(-event.relative.y * mouse_sensitivity)
	

func _process(delta: float) -> void:
	if Input.is_action_just_released("zoom_in"):
		$VBase/Camera3D.translate_object_local(Vector3.FORWARD * scroll_sensitivity)
	elif Input.is_action_just_released("zoom_out"):
		$VBase/Camera3D.translate_object_local(-Vector3.FORWARD * scroll_sensitivity)


func get_camera():
	return $VBase/Camera3D


func set_camera(cam):
	#$VBase/Camera3D.replace_by(cam) # would assume the camera has 
	# no children..
	
	# Instead, be sure and swap the subscene out.
	var t = $VBase/Camera3D.global_transform
	Swapper.swap_subbranches($VBase/Camera3D, cam)
	cam.global_transform = t
