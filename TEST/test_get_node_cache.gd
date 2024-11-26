extends Node3D
## $A DOES NOT CACHE THE REFERENCE !!!
## You must manually use @onready and store a reference if you want
## it to be cached.
## However, beware of if you're dynamically swapping nodes in the
## scene tree.

@onready var a = $A
@onready var b = $B


func _ready() -> void:
	#assert(a == $A)
	print(a == $A)
	print(b == $B)
	
	
	remove_child($A)
	print($A)
	
	#get_node()
