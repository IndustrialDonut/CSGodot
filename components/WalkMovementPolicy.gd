extends Object


const SPEED = 5.0
const JUMP_VELOCITY = 5.0
enum {
	CROUCHING,
	STANDING,
	FALLING,
}
var state = STANDING

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func process_movement(body : CharacterBody3D, head :Node3D, delta : float):
	# Add the gravity.
	if not body.is_on_floor():
		state = FALLING
	
	var bodymesh : MeshInstance3D = body.get_node("BodyMesh")
	bodymesh.mesh.height = 2.0
	bodymesh.position.y = 1.0
	
	match state:
		FALLING:
			# Ballistic
			body.velocity.y -= gravity * delta
			if body.is_on_floor():
				state = STANDING
		CROUCHING:
			# Only can walk (no jump), max-speed limited to half
			if not Input.is_action_pressed("control"):
				state = STANDING
			_accelerate(0.5, body, head)
			bodymesh.mesh.height = 1.5
			bodymesh.position.y = 0.75
		STANDING:
			var coef = 1.0
			# Can jump, and vary speed while walking
			if Input.is_action_pressed("control"):
				state = CROUCHING
			elif Input.is_action_just_pressed("ui_accept"):
				body.velocity.y = JUMP_VELOCITY
				state = FALLING
			elif Input.is_action_pressed("sprint"):
				# the 'key' for sprint is just shift but in CSGO actually slow-walk.
				coef = 0.5
			_accelerate(coef, body, head)
		_:
			printerr("Invalid Player Movement State")
			#state = STANDING
	
	body.move_and_slide()
	#print(state)


func _input_target_direction(head : Node3D):
	## Get the user input for the target direction, and transform it into global coordinates
	## based on the Node3D orientation given.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	return direction


func _accelerate(speed_coefficient : float, body : CharacterBody3D, head: Node3D):
	var direction = _input_target_direction(head)
	var wishspeed = SPEED * speed_coefficient
	
	# Propel or interpolate speed back to zero.
	if direction:
		body.velocity.x = lerp(body.velocity.x, float(direction.x * wishspeed), 0.1)
		body.velocity.z = lerp(body.velocity.z, float(direction.z * wishspeed), 0.1)
	else:
		body.velocity.x = lerp(body.velocity.x, 0.0, 0.1)
		body.velocity.z = lerp(body.velocity.z, 0.0, 0.1)
