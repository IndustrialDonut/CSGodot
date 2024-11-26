extends FireMode
class_name SemiAuto


func _init():
	timer_wait_time = 0.2


func squeeze() -> bool:
	var ready = _is_stopped()
	_start_timer()
	return ready
