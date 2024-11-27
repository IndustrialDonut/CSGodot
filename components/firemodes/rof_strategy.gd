class_name FireMode
extends Node

## Could also generalize this class actually as a 'regulator'
## or something like that, as it basically generates a signal for allowing
## another action to happen or not at a higher level.

var timer_wait_time : float = 0.1


func squeeze() -> bool:
	# return ready to fire status
	printerr("SQUEEZE NOT IMPLEMENTED in rof_strategy.gd (base class)")
	return false


func _start_timer():
	$Timer.start(timer_wait_time)


func _is_stopped():
	return $Timer.is_stopped()
