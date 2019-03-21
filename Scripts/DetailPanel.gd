extends Panel

var root_node
var board_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	
func _on_DetailPanel_mouse_entered():
	print("DING")
	board_node.on_menu = true
	
func _on_DetailPanel_mouse_exited():
	print("DONG")
	board_node.on_menu = false
