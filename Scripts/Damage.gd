extends TextEdit

var root_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if root_node.selected != null:
		self.text = root_node.selected.damage
	else:
		self.text = ""
	pass