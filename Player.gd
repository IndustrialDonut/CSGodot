extends CharacterBody3D


func _ready():
	# Inject component dependencies
	$MobilityPolicy.set_body(self)
	$MobilityPolicy.set_head($CameraOrbiter)
	$MobilityPolicy.set_policy('walk')
	$MobilityPolicy.activate()
	
	#$HUD.set_weapon_component($Weapon)
	#$HUD.set_health_component($Health)


#func _process(delta):
	#if Input.is_action_just_pressed("rmb"):
		#$Weapon.special()
	#if Input.is_action_pressed("lmb"):
		#$Weapon.fire()


func fire() -> void:
	# LMB
	if $FirePolicy.squeeze():
		print("bang!")
		$Shooter.shoot()


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
