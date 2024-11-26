extends Control
## The point of this test is to ensure that the callable's as registered are
## just the pointers to the object's method, and are not having references
## to variables bound as values into the code.
## It makes sense that it works this way, but I needed to confirm.

var i = 0
@onready var f := _function_factory_bound()
@onready var toggleable := Toggle.new(_on, f)


func _process(delta):
	if Input.is_action_just_pressed("save"):
		toggleable.toggle()
		i += 1


func _on():
	print(i)



## Even if you use a function factory, it is actually binding *the variable*
## to the function variable, instead of just 'rendering'
## the value of it into a constant in the function.
func _function_factory() -> Callable:
	var f = func(): print(i * 5)
	return f


## Here is how you would 'render the value' or 'take a snapshot' of the
## current instance variable and place it into the manufactured function.
## You BIND the current value at creation, to a parameter of the function.
func _function_factory_bound() -> Callable:
	var f = func(t): print(t * 5)
	return f.bind(i)
