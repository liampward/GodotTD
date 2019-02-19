extends Button

var root_node;

func _ready():
	root_node = get_tree().get_root().get_node("Root")

func _pressed():
	root_node.mode = root_node.Mode.SELL;
