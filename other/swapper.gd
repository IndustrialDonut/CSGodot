class_name Swapper
extends Object
## Swap the branches of the scene tree and preserve the owner and name
## information about the original branch.
## Return the original branch, in case you need to save it to switch
## back to later.


static func swap_subbranches(
	old_branch : Node, 
	new_branch : Node,
) -> Node:
	var p = old_branch.get_parent()
	var owner_ = old_branch.owner
	var name_ = old_branch.name
	p.remove_child(old_branch)
	p.add_child(new_branch)
	new_branch.name = name_
	new_branch.owner = owner_
	return old_branch
