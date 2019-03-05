extends Button

var root_node;
var board_node;

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")

func _pressed():
	var tile = board_node.selected_tile;
	
	if(tile.tower != null):
		board_node.ignore_list.remove(board_node.ignore_list.find(tile.tower.get_node("Area")))
		tile.tower.queue_free();
		tile.tower = null;
		root_node.money += 7;
