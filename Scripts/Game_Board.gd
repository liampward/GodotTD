extends Spatial

onready var gm = get_node("AStarNodes")
onready var as = AStar.new()

var board_size = 10
var RAY_LENGTH = 100
var selected_tile = null
var on_menu = false

# This is a dictionary that maps the positions of GridMap
# cells to the IDs of the corresponding A* nodes
var points = {}

func _ready():
	var Tile_Scene = load("res://Scenes/Game_Tile.tscn")
	var Wall_Scene = load("res://Scenes/wall.tscn")
	for i in range(0,board_size * 1.7):
		for j in range(0,board_size):
			var tile = Tile_Scene.instance()
			self.add_child(tile)
			tile.set_translation(Vector3(i * 2.75, 0, j * -2.75))
#			gm.set_cell_item(i * 2.75, 0, j * -2.75, 0)
	var wall = Wall_Scene.instance()
	self.add_child(wall)
	wall.set_translation(Vector3((board_size * 1.7) * 2.75, 0, (board_size / 2) * -2.75))
	wall.set_scale(Vector3(0.2, 2, board_size * 1.7))

func _process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT) and on_menu == false):
		var collision = get_object_under_mouse()
		if !collision.empty(): ##yeet
			if selected_tile != null:
				selected_tile.selected = false
			collision.collider.get_parent().selected = true
			selected_tile = collision.collider.get_parent()

func get_object_under_mouse():
	var camera = get_node("../CameraPivotX/CameraPivotY/Camera")
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = camera.project_ray_origin(mouse_pos)
	var ray_to = ray_from + camera.project_ray_normal(mouse_pos) * RAY_LENGTH
	var space_state = camera.get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to, [], 16)
	return selection

func _on_GameArea_mouse_entered():
	on_menu = false

func _on_GameArea_mouse_exited():
	on_menu = true
