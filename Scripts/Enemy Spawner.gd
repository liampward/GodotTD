extends Spatial

# class member variables go here, for example:
var Root_Node
var Board_Node
var Enemy_Timer
var Enemy
var MagicEnemy
var done_spawning

func _ready():
	Root_Node = get_tree().get_root().get_node("Root")
	Board_Node = Root_Node.get_node("Board")
	Enemy = load("res://Scenes/Enemy.tscn")
	MagicEnemy = load("res://Scenes/MagicEnemy.tscn")
	PhysicalEnemy = load("res://Scenes/Enemy.tscn")
	done_spawning = true

#func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	pass

func Spawn(Type):
	if (Type == 3):
		var Clone = MagicEnemy.instance()
	elif(Type == 2):
		var Clone = Enemy.instance()
	else:
		var Clone = Enemy.instance()
	Root_Node.add_child(Clone)
	var size = Board_Node.board_size
	Clone.set_translation(Vector3(0, 0, 0))
	Board_Node.ignore_list.append(Clone.get_node("Area"))

func SpawnWave(T):
	done_spawning = false
	for i in range(0,T):
		num = randi()%3+1
		Spawn(num)
		yield(get_tree().create_timer(1.0), "timeout")
	done_spawning = true

