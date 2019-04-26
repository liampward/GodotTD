extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Root_Node
var Spawn_Node

func _ready():
	Root_Node = get_tree().get_root().get_node("Root")
	Spawn_Node = Root_Node.get_node("EnemySpawner")

func _pressed():
	if Spawn_Node.done_spawning == true:
		Root_Node.wave_num += 1
		Spawn_Node.ParseWave()
		get_node("../EnemyCount").visible = true
		self.visible = false
	

