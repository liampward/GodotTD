extends "TowerPurchase.gd"


func _pressed():
	if board_node.selected_tile != null:
		if board_node.selected_tile.tower != null:
			upgrade(1)
		if board_node.selected_tile.tower == null:
			purchase("NEUTRAL")