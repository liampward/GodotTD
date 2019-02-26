extends Button

var root_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")

func _pressed():
	if root_node.selected != null:
		root_node.selected.upgrade_1()