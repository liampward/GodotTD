extends Button

var root_node;
var board_node;

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")

func _pressed():

<<<<<<< HEAD
	if(tile.tower != null):
		board_node.as.add_point(
					tile.astar_node_id, 
		            tile.astar_node_pos)
		
		var c = board_node.as.get_point_position(tile.astar_node_id)
		for x in [-1, 0, 1]:
			for z in [-1, 0, 1]:
				if x == 0 and z == 0:
					continue
				var offset = Vector3(x, 0, z)
				if board_node.vec3_to_string(c + offset) in board_node.points:
					var id2 = board_node.points[board_node.vec3_to_string(c + offset)]
					if not board_node.as.are_points_connected(tile.astar_node_id, id2):
						board_node.as.connect_points(tile.astar_node_id, id2, true)
		
=======
	if(board_node.selected_tile != null and board_node.selected_tile.tower != null):
		var tile = board_node.selected_tile;
>>>>>>> ce74f67b1bf26047bb60b0ad7e4b514921ac440a
		root_node.money += (tile.tower.price - (tile.tower.price / 3));
		tile.tower.queue_free();
		tile.tower = null;