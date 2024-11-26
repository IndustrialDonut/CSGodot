extends FireMode
class_name FullAuto


func _init():
	timer_wait_time = 0.001


func squeeze() -> bool:
	var ready = _is_stopped()
	if ready:
		_start_timer()
	return ready
