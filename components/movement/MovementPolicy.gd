class_name MovementPolicy
extends Node

## Somewhat unfortunate that you cannot just use 'set_script()' as you
## had hoped for. That works by clearing the working script instance
## and then creating the new one. So, all instance variables are lost,
## even if you are setting a script which is a child class of the current
## script in use. 
## What the documentation meant, I believe, is that if you're setting a
## script that is a subclass of the *Object*'s type then it will leave
## that object's instance variables in place.
## i.e. obviously you do not expect that by setting the script on a Node3D
## that the position and rotation will be reset.
## However, by REPLACING the working script on that same Node3D, all
## instance variables will be lost of that.
## The question is if you're able to subclass and instance the particular type
## in the scene tree first so that you're not using an 'attached script' in
## in the first place and then can switch an attached script out without
## wiping instance variables. Yeah that's a pain in the ass forget that.

var is_active = false
var head : Node3D # for determining direction
var body : CharacterBody3D
var policy


# ALL policies are maintained here, and if you need a player
# with only a subset allowed, then define that in terms of the
# mobility policy keywords he can cycle through.
var mobility_policies = {
	'fly' : load("res://components/movement/FlyMovementPolicy.gd"),
	'walk' : load("res://components/movement/WalkMovementPolicy.gd"),
}


func _physics_process(delta):
	if not is_active:
		return
	
	if policy:
		policy.process_movement(body, head, delta)
	else:
		printerr("No movement policy set")


func activate():
	is_active = true


func deactivate():
	is_active = false


func set_head(head: Node3D):
	self.head = head


func set_body(body : CharacterBody3D):
	self.body = body


func set_policy(p : String):
	var resource = mobility_policies[p]
	policy = resource.new()

