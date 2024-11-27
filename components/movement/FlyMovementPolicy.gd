extends Object

const SPEED = 5


func process_movement(body, delta):
	var up = Input.get_axis("crouch", "fire")
	body.velocity.y = up * SPEED
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (body.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	body.velocity.x = direction.x * SPEED
	body.velocity.z = direction.z * SPEED
	
	body.move_and_slide()
	#body.move_and_collide()
