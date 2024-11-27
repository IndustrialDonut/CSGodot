class_name ReloadMode
extends Node

enum {
	NONE,
	MAGAZINE,
	SINGLE,
}
var mode := NONE
var remaining_rounds := 0
var remaining_other_rounds := 0

var _magsize : int

func reload():
	if mode == NONE:
		pass
	elif mode == MAGAZINE:
		if remaining_other_rounds:
			var c = min(remaining_other_rounds, _magsize)
			remaining_rounds = c
			remaining_other_rounds -= c
	elif mode == SINGLE:
		if remaining_other_rounds and remaining_rounds < _magsize:
			var c = 1
			remaining_rounds += c
			remaining_other_rounds -= c


func can_shoot():
	return remaining_rounds > 0


func decrement_ammunition():
	remaining_rounds -= 1


func set_mag_size(rounds : int):
	_magsize = rounds
	remaining_rounds = _magsize
	remaining_other_rounds = _magsize * 2


#func set_reload_mode
