extends Button

var root_node;
var board_node;

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")

func _pressed():
<<<<<<< HEAD
	var tile = board_node.selected_tile
	
	if(tile != null and tile.tower != null):
		root_node.money += (tile.tower.price - (tile.tower.price / 3));
		tile.tower.queue_free();
		tile.tower = null;
		
=======
	var tile = board_node.selected_tile;

	if(tile.tower != null):
>>>>>>> 1ff0a9ebb94e2583bbf1f39d877a40aec1decf09
		board_node.as.add_point(
					tile.astar_node_id,
		            board_node.gm.map_to_world(tile.astar_node_pos.x,
												tile.astar_node_pos.y,
												tile.astar_node_pos.z))
		
		var c = tile.astar_node_pos
		for x in [-1, 0, 1]:
			for z in [-1, 0, 1]:
				if x == 0 and z == 0:
					continue
				var offset = Vector3(x, 0, z)
				if board_node.vec3_to_string(c + offset) in board_node.points:
					var id2 = board_node.points[board_node.vec3_to_string(c + offset)]
					if not board_node.as.are_points_connected(tile.astar_node_id, id2):
						print("CONNECTING " + str(id2) + " AND " + str(tile.astar_node_id))
						board_node.as.connect_points(tile.astar_node_id, id2, true)
		if(tile.astar_node_id == 97):
			board_node.as.connect_points(tile.astar_node_id, 1, true)
		get_tree().call_group("ENEMY", "move_to", Vector3(33, 0, 10))
		
