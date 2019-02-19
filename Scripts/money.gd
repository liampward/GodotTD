extends TextEdit

var root_node;

func _ready():
	root_node = get_tree().get_root().get_node("Root")


func _process(delta):
	self.text = str(root_node.money)
