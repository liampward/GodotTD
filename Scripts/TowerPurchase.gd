extends Button

var root_node
var board_node
var text_node
var NEUTRAL
var PHYSICAL
var MAGIC

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	text_node = root_node.get_node("MainPanel/DisplayText")
	NEUTRAL = preload("res://Scenes/baseTower.tscn")
	PHYSICAL = preload("res://Scenes/physTower.tscn")
	MAGIC = preload("res://Scenes/magicTower.tscn")

func upgrade(num):
	if board_node.selected_tile != null:
		var tower = board_node.selected_tile.tower
		if tower != null:
			if tower.upgradeLevel < 2:
				if root_node.money >= tower.price + 10:
					board_node.selected_tile.tower.upgrade(num)
					root_node.money -= board_node.selected_tile.tower.price
				else:
					text_node.display_text("Out of money")
			else:
				text_node.display_text("Can't stack higher")
			
func purchase(type):
	if(board_node.selected_tile != null):
		var tile = board_node.selected_tile
		var tile_scale = tile.get_scale()
		var new_tower
		##Super hacky way of making sure the player
		##doesn't break the path when they buy a tower
		
		board_node.as.remove_point(tile.astar_node_id)
		if(board_node.as.get_point_path(1, 82).size() == 0):
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
							board_node.as.connect_points(tile.astar_node_id, id2, true)
			if(tile.astar_node_id == 97):
				board_node.as.connect_points(tile.astar_node_id, 1, true)
			text_node.display_text("That would block the path")
			return
			
			
		# Replace this with a switch?
		if(type == "NEUTRAL"):
			new_tower = NEUTRAL.instance()
			new_tower.setType(new_tower.NEUT)
			new_tower.stackName = "Neutral"
		if(type == "PHYSICAL"):
			new_tower = PHYSICAL.instance()
			new_tower.setType(new_tower.PHYS)
			new_tower.stackName = "Physical"
		if(type == "MAGIC"):
			new_tower = MAGIC.instance()
			new_tower.setType(new_tower.MAG)
			new_tower.stackName = "Magical"
		
		if(tile.tower == null && root_node.money >= 10):
			new_tower.bottomTower = true
			new_tower.set_scale(Vector3(1, 1 / tile_scale.y, 1))
			tile.add_child(new_tower)
			tile.tower = new_tower
			root_node.money -= board_node.selected_tile.tower.price
			board_node.as.remove_point(tile.astar_node_id)
			get_tree().call_group("ENEMY", "move_to", Vector3(33, 0, 10))
