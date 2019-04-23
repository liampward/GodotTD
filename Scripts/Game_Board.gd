extends Spatial

const RAY_LENGTH = 100
const BOARD_ROWS = 16
const BOARD_COLS = 11

onready var tile = preload("res://Scenes/GameTile.tscn")
onready var wall = preload("res://Scenes/Wall.tscn")
onready var gm = get_node("AStarNodes")
onready var as = AStar.new()

var selected_tile = null
var on_menu = false
var tile_list = []

# This is a dictionary that maps the positions of GridMap
# cells to the IDs of the corresponding A* nodes
var points = {}

func _ready():
	# Build the game board
	for z in range(BOARD_COLS):
		for x in range(BOARD_ROWS):
			var new_tile = tile.instance()
			var pos = Vector3((x * 2) + 1, 0, (z * 2) + 1)
			if pos == Vector3(1, 0, 11):
				var matl = SpatialMaterial.new()
				new_tile.set_material_override(matl)
				matl.albedo_color = Color(1, 0, 0)
			new_tile.set_translation(pos)
			add_child(new_tile)
			tile_list.append(new_tile)
			var map_pos = gm.world_to_map(pos)
			gm.set_cell_item(map_pos.x, map_pos.y, map_pos.z, 0)
	var new_wall = wall.instance()
	var wall_pos = Vector3((BOARD_ROWS * 2) + 1, 1, BOARD_COLS)
	var wall_node_id = as.get_available_point_id()
	new_wall.set_translation(wall_pos)
	add_child(new_wall)
	as.add_point(wall_node_id, wall_pos)

	# Set camera pivot to the center of the game board
	var cam_pivot_x = get_parent().get_node("CameraPivotX")
	cam_pivot_x.set_translation(Vector3(BOARD_ROWS, 0, BOARD_COLS))

	# Get all the GridMap cells (red cubes) in the level
	var cells = gm.get_used_cells()

	# Create a graph of A* nodes (one for each red cube)
	var idx = 0
	for c in cells:
		var id = as.get_available_point_id()
		as.add_point(id, gm.map_to_world(c.x, c.y, c.z))
		points[vec3_to_string(c)] = id
		tile_list[idx].astar_node_id = id
		tile_list[idx].astar_node_pos = Vector3(c.x, c.y, c.z)
		idx += 1

	# Connect all the nodes on the graph to their neighbors
	for c in cells:
		for x in [-1, 0, 1]:
			for z in [-1, 0, 1]:
				if x == 0 and z == 0:
					continue
				var offset = Vector3(x, 0, z)
				if vec3_to_string(c + offset) in points:
					var id1 = points[vec3_to_string(c)]
					var id2 = points[vec3_to_string(c + offset)]
					if not as.are_points_connected(id1, id2):
						as.connect_points(id1, id2, true)
	as.connect_points(points[vec3_to_string(Vector3(15, 0, 5))], wall_node_id, true)

func _process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT) and on_menu == false):
		var collision = get_object_under_mouse()
		if !collision.empty():
			if selected_tile != null:
				selected_tile.selected = false
			collision.collider.get_parent().selected = true
			selected_tile = collision.collider.get_parent()
		else:
			if selected_tile != null:
				selected_tile.selected = false
			selected_tile = null

func get_object_under_mouse():
	var camera = get_node("../CameraPivotX/CameraPivotY/Camera")
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = camera.project_ray_origin(mouse_pos)
	var ray_to = ray_from + camera.project_ray_normal(mouse_pos) * RAY_LENGTH
	var space_state = camera.get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to, [], 16)
	return selection

func vec3_to_string(v):
	"""
	Convert a Vector3 into a string for use as a dictionary key.

	:param v: The Vector3 to be converted
	:return: A string of the form "x,y,z"
	"""
	return str(int(round(v.x))) + "," + str(int(round(v.y))) + "," + str(int(round(v.z)))

func get_path(start, end):
	"""
	Find the shortest path between two global positions using the A* algorithm.

	:param start: A Vector3 representing the starting position
	:param end: A Vector3 representing the ending position
	:return: An array of the points that form the path, ordered from start to end
	"""
	var gm_start = vec3_to_string(gm.world_to_map(start))
	var gm_end = vec3_to_string(gm.world_to_map(end))
	var start_id = 0
	var end_id = 0
	if gm_start in points:
		start_id = points[gm_start]
	else:
		start_id = as.get_closest_point(start)
	if gm_end in points:
		end_id = points[gm_end]
	else:
		end_id = as.get_closest_point(end)
	return as.get_point_path(start_id, end_id)

func _on_GameArea_mouse_entered():
	on_menu = false

func _on_GameArea_mouse_exited():
	on_menu = true
