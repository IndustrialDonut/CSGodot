class_name Saver
extends Object
## Save a whole branch of the scene tree to disk.


static func save(node : Node, path : String):
	var ps = PackedScene.new()
	node.propagate_call('set_owner', [node]) # parent-first irrelevant
	
	var error = ps.pack(node)
	ResourceSaver.save(ps, path)


static func alt_save(branch_root : Node, path):
	var ps = PackedScene.new()
	
	_recurse_nodes(
		branch_root,
		func(node): node.owner = branch_root,
	)
	
	var error = ps.pack(branch_root)
	ResourceSaver.save(ps, path)


static func _recurse_nodes(root_node : Node, f : Callable):
	## Depth first recursion with arbitrary lambda operation on each child.
	## Does not call the lambda on the root node itself!
	for child in root_node.get_children():
		f.call(child)
		_recurse_nodes(child, f)
