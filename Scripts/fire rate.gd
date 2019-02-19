extends TextEdit

var root_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")

func _process(delta):
	if root_node.selected != null:
		self.text = root_node.selected.fire_rate
	else:
		self.text = ""
	pass