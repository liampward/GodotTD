extends Control

var root_node
var board_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")

func _process(delta):
	if board_node.selected_tile != null:
		if board_node.selected_tile.tower != null:
			$Range.text = str(board_node.selected_tile.tower.fireRange)
			$FireRate.text = str(board_node.selected_tile.tower.fireRate)
			$Damage.text = str(board_node.selected_tile.tower.damage)
		else:
			$Range.text = ""
			$FireRate.text = ""
			$Damage.text = ""
	else:
		$Range.text = ""
		$FireRate.text = ""
		$Damage.text = ""
	pass