extends Node3D
class_name Weapon


# Public interface
func fire() -> void:
	# LMB
	# if $Regulator.ready():
	if $FirePolicy.squeeze():
		print("bang!")
		$Shooter.shoot()
		#$Regulator.reset()


func special() -> void:
	# RMB
	$SpecialPolicy.execute(self)


func reload() -> void:
	# R
	pass


# Getters and setters
func set_fire_mode(firemode : FireMode) -> void:
	Swapper.swap_subbranches($FirePolicy, firemode)


func get_fire_mode() -> FireMode:
	return $FirePolicy


func set_shooter(shooter : Node) -> void:
	Swapper.swap_subbranches($Shooter, shooter)


func get_shooter() -> Node:
	return $Shooter


func set_magazine(magazine : Node) -> void:
	Swapper.swap_subbranches($ReloadPolicy, magazine)


func get_magazine() -> Node:
	return $ReloadPolicy
