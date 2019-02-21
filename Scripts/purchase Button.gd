extends Button

var root_node
var board_node
var new_tower_resource = preload("res://Scenes/baseTower.tscn");

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	new_tower_resource = preload("res://Scenes/baseTower.tscn");

func _pressed():
	var tile = board_node.selected_tile
	
	if(tile.tower == null):
		var new_tower = new_tower_resource.instance();
		new_tower.set_translation(Vector3(0, 10, 0))
		tile.add_child(new_tower);