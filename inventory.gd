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


func add_weapon(weapon):
	var slot = weapon_slot_map[weapon.slot_code]
	slot.set_weapon(weapon)



#
#
#func set_weapon(weapon):
	#var slots = get_children()
	#var slot = slots[weapon.slot_index]
	#slot.set_weapon(weapon)



#func switch_weapon(weapon):
	#match weapon.slot_code:
		#'primary':
			#$PrimarySlot.set_weapon(weapon)
		#'secondary':
			#$SecondarySlot.set_weapon(weapon)
		#'lethal':
			#$LethalSlot.set_weapon(weapon)
		#'nonlethal':
			#$NonLethalSlot.set_weapon(weapon)
		#'smoke':
			#$SmokeSlot.set_weapon(weapon)
		#'knife':
			#$KnifeSlot.set_weapon(weapon)
		#'bomb':
			#$BombSlot.set_weapon(weapon)
		#_:
			#printerr("Error: Weapon Slot Code does not exist.")
			#return -1
