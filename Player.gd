extends CharacterBody3D


func _ready():
	# Inject component dependencies
	$MobilityPolicy.set_body(self)
	$MobilityPolicy.set_head($CameraOrbiter)
	$MobilityPolicy.set_policy('walk')
	$MobilityPolicy.activate()
	
	$Shooter.ammo = $ReloadPolicy
	
	$Inventory.set_player(self)
	
	var g18 = MasterConfig.config['G18']
	$Inventory.add_weapon(g18)
	var g18p = MasterConfig.config['AWP']
	$Inventory.add_weapon(g18p)
	
	#$HUD.set_weapon_component($Weapon)
	#$HUD.set_health_component($Health)
	$HUD.fire_policy = $FirePolicy
	$HUD.ammo_policy = $ReloadPolicy


func _process(delta):
	#if Input.is_action_just_pressed("last_weapon"):
		#$Inventory.last_weapon()
	if Input.is_action_just_pressed("primary"):
		$Inventory.equip(Enums.PRIMARY)
	if Input.is_action_just_pressed("secondary"):
		$Inventory.equip(Enums.SECONDARY)
	if Input.is_action_just_pressed("rmb"):
		special()
	if Input.is_action_pressed("lmb"):
		fire()
	if Input.is_action_just_pressed("reload"):
		reload()


func fire() -> void:
	# LMB
	$FirePolicy.squeeze($Shooter.shoot)


func special() -> void:
	# RMB
	print("Executing special..", $SpecialPolicy)
	$SpecialPolicy.execute(self)


func reload() -> void:
	# R
	$ReloadPolicy.reload()


# Getters and setters
func set_fire_mode(firemode) -> void:
	$FirePolicy.mode = firemode


func get_fire_mode():
	return $FirePolicy.mode


func set_shooter(shooter : Node) -> void:
	Swapper.swap_subbranches($Shooter, shooter)


func get_shooter() -> Node:
	return $Shooter


func set_mag_size(s : int) -> void:
	$ReloadPolicy.set_mag_size(s)


func set_reload_mode(m : int) -> void:
	$ReloadPolicy.mode = m


func set_weapon_model(model : String) -> void:
	for child in $EquippedModel.get_children():
		child.queue_free()
	
	$EquippedModel.add_child(load(model).instantiate())


func set_special(special : Node):
	#var p = load(special)
	assert(special, "Cannot assign null special (use specific NoSpecial if this is your intent)")
	#$SpecialPolicy.set_script(special)
	Swapper.swap_subbranches($SpecialPolicy, special)


func show_scope():
	$Scope.show()


func hide_scope():
	$Scope.hide()
