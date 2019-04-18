extends Control

var root_node
var board_node
func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
func _process(delta):
	$Lives_num.text = str(root_node.health)
	$Money_num.text = str(root_node.money)
	$WaveCount.text = str(root_node.wave_num)
	
	
	if board_node.selected_tile != null and board_node.selected_tile.tower != null:
		var T = board_node.selected_tile.tower
		if T.upgradeLevel < 2:
			$buy_num.text = str(T.price + 10)
		else:
			$buy_num.text = ""
		$sell_num.text = str(T.price - (T.price / 3))
		
	elif board_node.selected_tile != null:
		$buy_num.text = "10"
		$sell_num.text =""
	else:
		$sell_num.text =""
		$buy_num.text = ""
