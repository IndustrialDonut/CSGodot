extends CharacterBody3D


func _ready():
	# Inject component dependencies
	$MobilityPolicy.set_body(self)
	$MobilityPolicy.set_head($CameraOrbiter)
	$MobilityPolicy.set_policy('walk')
	$MobilityPolicy.activate()
	
	$Inventory.set_player(self)
	
	var g18 = MasterConfig.config['G18']
	$Inventory.add_weapon(g18)
	
	#$HUD.set_weapon_component($Weapon)
	#$HUD.set_health_component($Health)
	$HUD.fire_policy = $FirePolicy


func _process(delta):
	#if Input.is_action_just_pressed("last_weapon"):
		#$Inventory.last_weapon()
	if Input.is_action_just_pressed("secondary"):
		$Inventory.equip(Enums.SECONDARY)
	if Input.is_action_just_pressed("rmb"):
		special()
	if Input.is_action_pressed("lmb"):
		fire()


func fire() -> void:
	# LMB
	$FirePolicy.squeeze($Shooter.shoot)


func special() -> void:
	# RMB
	print("Executing special..", $SpecialPolicy)
	$SpecialPolicy.execute(self)


func reload() -> void:
	# R
	pass


# Getters and setters
func set_fire_mode(firemode) -> void:
	$FirePolicy.mode = firemode


func get_fire_mode():
	return $FirePolicy.mode


func set_shooter(shooter : Node) -> void:
	Swapper.swap_subbranches($Shooter, shooter)


func get_shooter() -> Node:
	return $Shooter


func set_magazine(magazine : Node) -> void:
	Swapper.swap_subbranches($ReloadPolicy, magazine)


func get_magazine() -> Node:
	return $ReloadPolicy


func set_weapon_model(model : String) -> void:
	for child in $EquippedModel.get_children():
		child.queue_free()
	
	$EquippedModel.add_child(load(model).instantiate())


func set_special(special : Node):
	#var p = load(special)
	assert(special, "Cannot assign null special (use specific NoSpecial if this is your intent)")
	#$SpecialPolicy.set_script(special)
	Swapper.swap_subbranches($SpecialPolicy, special)
