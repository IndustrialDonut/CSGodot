extends Node3D

## TEST !!!!
## This is how you test / mock the Input singleton without actually
## needing to make a double of the class and inject it.


#var moves = [
	#['ui_up', 1],
	#['ui_down', 1],
	#['ui_right', 2],
	#['ui_left', 3],
	#['ui_down', 1],
	#['ui_up', 3],
#]
#
#var current_move
#var time_remaining
##var is_testing = false
#
#func _ready():
	#next_move()
#
#
#func _process(delta):
	#if Input.is_action_just_pressed("ui_focus_next"):
		#next_movement_script()
	#
	#if Input.is_action_pressed("test"):
		#if time_remaining > 0:
			#Input.action_press(current_move)
			#time_remaining -= delta
		#else:
			#Input.action_press(current_move, 0) # cancel the existing press
			#next_move()
	#else:
		#Input.action_press(current_move, 0) # cancel the existing press
#
#
#func next_move():
	#if len(moves):
		#var t = moves.pop_front()
		#current_move = t[0]
		#time_remaining = t[1]


#func next_movement_script():
	#$Player.next_movement_policy()

