extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var board_size = 5

func _ready():
	var Tile_Scene = load("res://Game_Tile.tscn")
	for i in range(0,board_size):
		for j in range(0,board_size):
			var tile = Tile_Scene.instance()
			self.add_child(tile)
			tile.set_translation(Vector3(i*3, 0, j*-3))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func a_star(start, goal):
	checked_nodes = []
	
	discovered_nodes = []
	
	came_from = {}
	
	for i in range(0,board_size):
		for j in range(0,board_size):
			pass
	
	


func pathfind():
	pass
