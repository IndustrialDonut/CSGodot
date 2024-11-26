extends CanvasLayer

# Be careful of enums...
enum WeapType {
	PRIMARY,
	SECONDARY,
	LETHAL,
	NONLETHAL,
	SMOKE,
	KNIFE,
}


var health_component
var weapon_component
var mobility_component
var inventory_component


func _process(delta: float) -> void:
	pass
	#_report_health(health_component)
	#_report_ammo(weapon_component)
	#report_stance(mobility_component)
	#report_stamina(mobility_component)


func _report_health(health_component):
	$HealthBar.value = health_component.hp


func _report_ammo(weapon):
	var loaded_ammo = weapon.get_loaded_ammo()
	var other_ammo = weapon.get_other_ammo()
	$AmmoLabel.text = "%d / %d" % [loaded_ammo, other_ammo]



func set_health_component(component):
	health_component = component


func set_weapon_component(weapon):
	weapon_component = weapon


## This is obviously not the final form this will take.
## I will need some kind of DTO perhaps though.
## Maybe each weapon does have an associated UI card.
## That itself isn't the problem necesarilly.
## What is the problem is the coordination of each into a 'slot'.
## Basically, each weapon in the config will be designated to a slot
## that it fits in, i.e. either
## Primary, Secondary, Lethal (throwable), etc etc
## It'll have a specified 'userland' type.
## So, that's basically a case to just do a switch statement on imo.
## I don't see how polymorphism would fix that.
## The only thing I DO see is populating a known DTO as a common 
## interface, that then just maps without any conditional logic
## at all.
## But, what I don't love about that is it might make the weapon
## class or the player class, the business logic basically,
## too aware of the GUI... So, if I were to change the requirement
## on the GUI a little, I might end up having to change the business
## logic in the player etc to support that again, and I don't love
## that. 
## The most I want to concede, ideally, is the 'type' field on the
## weapon at construction time, as will be designated in the config.
func _on_weapon_changed(weapons, active_weapon):
	_show_weapon_wheel(weapons, active_weapon)


func _show_weapon_wheel(weapons, active_weapon):
	#$WeaponWheel/Primary.replace_by(weapons.primary)
	#$WeaponWheel/Secondary.replace_by(weapons.secondary)
	#$WeaponWheel/Lethal.replace_by(weapons.lethal)
	#$WeaponWheel/Nonlethal.replace_by(weapons.nonlethal)
	#$WeaponWheel/Smoke.replace_by(weapons.smoke)
	#$WeaponWheel/Knife.replace_by(weapons.knife)
	
	#active_weapon.highlight()
	
	## This switch statement WOULD have to be repeated though,
	## in the actual player inventory itself.
	## It is not just here!
	## Is it more likely that we're going to add more types,
	## or more functions to the existing types?
	## I think that the types are as follows:
	## Primary, Pistol, Lethal, NonLethal, Smoke, Knife
	## Would we add more types...? more granularity?
	## Honestly probably not? But, alas we already know that
	## the switch is going to be repeated... 
	## I would prefer to use polymorphism to avoid the duplication.
	#for weapon in weapons:
		#match weapon.type:
			#'primary':
				#$WeaponWheel/Primary
			#'secondary':
				#$WeaponWheel/Secondary
			#'lethal':
				#$WeaponWheel/Lethal
	
	
	## I like this better than the match / switch statement,
	## but it's still basically the same thing.
	## In the Payroll application, it was better because I was
	## actually defining a new mapping between keywords to turn
	## into new transactions.
	## Here, however, WeaponType enum would be shared between
	## the inventory slots as well. Therefore, 
	#var slot_map = {
		#WeapType.PRIMARY : $WeaponWheel/Primary,
		#WeapType.SECONDARY : $WeaponWheel/Secondary,
		#WeapType.LETHAL : $WeaponWheel/Lethal,
		#WeapType.NONLETHAL : $WeaponWheel/Nonlethal,
	#}
	#
	#for weapon in weapons:
		#var slot = slot_map[weapon.type]
		#
		## update slot card with weapon
		#slot.weapon_card = weapon.card
		
	## The real solution is to use the fact that the GUI should
	## be dumb and not know ANYTHING business-logic at all!
	## The weapon wheel doesn't need to KNOW that the slots are
	## type-restricted in the first place!
	## The weapon wheel JUST NEEDS TO HAVE WEAPON SLOTS,
	## and the Inventory or whatever on the Player manages inventory
	## will report to it what is in a certain slot index.
	## Therefore, I do need to match the length of each at least,
	## but that's basically it. 
	## I can very well generate the weapon wheel dynamically,
	## even.
	
	# this runs when weapons are updated.
	clear_weapon_wheel()
	render_weapon_wheel_cards(weapons, active_weapon)


func clear_weapon_wheel():
	for child in $WeaponWheel.get_children():
		child.queue_free()


func render_weapon_wheel_cards(weapons, active_weapon):
	#for weapon in weapons:
		#var card = weapon.get_ui_card()
		#$WeaponWheel.add_child(card)
		#
		#if weapon == active_weapon:
			#card.highlight()
	
	# another option:
	$WeaponWheel/Primary.set_weapon(inventory_component.get_primary())
	$WeaponWheel/Secondary.set_weapon(inventory_component.get_secondary())
	$WeaponWheel/Lethal.set_weapon(inventory_component.get_lethal())
	$WeaponWheel/Nonlethal.set_weapon(inventory_component.get_nonlethal())
	# ...
	# ...
	
