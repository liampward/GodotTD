extends Label

var root_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	get_node("Rounds").text = str(root_node.wave_num) + " Rounds"