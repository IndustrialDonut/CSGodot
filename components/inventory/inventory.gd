extends Node3D


@onready var weapon_slot_map = {
	Enums.PRIMARY : $PrimarySlot,
	Enums.SECONDARY : $SecondarySlot,
	Enums.LETHAL : $LethalSlot,
	Enums.NONLETHAL : $NonLethalSlot,
	Enums.SMOKE : $SmokeSlot,
	Enums.KNIFE : $KnifeSlot,
	Enums.BOMB : $BombSlot,
}

var _player
#var _equipped : Node3D
#var _last_equipped : Node3D


func add_weapon(weapon):
	var slot = weapon_slot_map[weapon.slot_code]
	#slot.set_weapon(weapon)
	slot.add_child(
		load(weapon.model).instantiate()
	)
	slot.weapon_config = weapon


func equip(enum_):
	var slot = weapon_slot_map[enum_]
	var config = slot.weapon_config
	
	if config:
		_map_config_to_components(config)
		slot.hide()
		
		#_last_equipped = _equipped
		#_equipped = slot


func set_player(player):
	self._player = player


func _map_config_to_components(config):
	_player.set_weapon_model(config.model)
	_player.set_fire_mode(config.firemode)
	_player.set_special(config.special)
	_player.set_mag_size(config.magsize)
	_player.set_reload_mode(config.magmode)
