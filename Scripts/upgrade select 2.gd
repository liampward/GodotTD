extends Button

var root_node
var board_node
func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
func _pressed():
	if board_node.selected_tile != null:
		if board_node.selected_tile.tower != null:
			board_node.selected_tile.tower.upgrade(2)