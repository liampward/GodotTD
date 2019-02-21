extends Button

var root_node
var board_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_child("Board")

func _pressed():
	var tile = board_node.selected_tile
	
	if(tile.tower == null):
		var new_tower = preload("res://Scenes/baseTower.tscn");
		tile.add_child(new_tower);