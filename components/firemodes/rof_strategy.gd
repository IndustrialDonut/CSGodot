class_name FireMode
extends Node

enum {
	SAFE,
	SEMI,
	AUTO,
	BURST,
}
var mode := SAFE

var _rounds_remaining = 0
var _trigger_held := false


func squeeze(f : Callable):
	var trigger_was_held = _trigger_held
	_trigger_held = true
	$TriggerRelease.start()
	
	if mode == 1 and not trigger_was_held:
		f.call()
	#elif weapon_mode == 2 and a < b:
		#f.call()
		#a = b
	elif mode == 3 and not trigger_was_held:
		f.call()
		_rounds_remaining = 2
		$RofTimer.start()
		$RofTimer.timeout.connect(_on_roftimer_burst.bind(f))


func set_rpm(rpm : int):
	var rps = float(rpm) / 60.0
	var spr = 1.0 / rps
	var T = spr
	
	#rof_period = T
	$RofTimer.wait_time = T


func _on_roftimer_burst(f : Callable):
	f.call()
	_rounds_remaining -= 1
	if _rounds_remaining == 0:
		$RofTimer.stop()
		$RofTimer.timeout.disconnect(_on_roftimer_burst)
		#get_tree().create_timer(1.0).timeout.disconnect()


func _on_trigger_release_timeout() -> void:
	_trigger_held = false
