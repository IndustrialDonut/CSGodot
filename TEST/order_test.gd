extends Node
## This demonstrates the the godot scene tree processing algorithm is a
## top-down depth-first recursive execution model, calling _process on every
## node.
## It also shows that even with the _physics_process, the order is the same,
## and they are all executed in a physics step which is separate from
## the rendering step.


func _process(delta):
	print(self.name)


func _physics_process(delta):
	print("physica: ", self.name)
