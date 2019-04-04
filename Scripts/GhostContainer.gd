extends Spatial

var root_node
var board_node
var towers = []

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	towers.append($GhostNeut)
	towers.append($GhostPhys)
	towers.append($GhostMag)

func move_tower(type):
	if(board_node.selected_tile != null):
		if(board_node.selected_tile.tower == null):
			towers[type].set_translation(board_node.selected_tile.get_translation())
			towers[type].visible = true
		else:
			pass # on 
		