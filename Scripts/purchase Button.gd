extends Button

var root_node
var board_node
var new_tower_resource

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	new_tower_resource = preload("res://Scenes/baseTower.tscn");

func _pressed():
	var tile = board_node.selected_tile
	var tile_scale = tile.get_scale();
	
	if(tile.tower == null && root_node.money >= 10):
		var new_tower = new_tower_resource.instance();
		new_tower.set_translation(Vector3(0, 3, 0))
		new_tower.set_scale(Vector3(1, 1 / tile_scale.y, 1))
		tile.add_child(new_tower)
		tile.tower = new_tower
		board_node.ignore_list.append(new_tower.get_node("Area"))
		root_node.money -= 10