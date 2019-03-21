extends Spatial

# class member variables go here, for example:
var Root_Node
var Board_Node
var Enemy_Timer
var NeutralEnemy
var MagicEnemy
var PhysicalEnemy
var done_spawning
var num

func _ready():
	Root_Node = get_tree().get_root().get_node("Root")
	Board_Node = Root_Node.get_node("Board")
	NeutralEnemy = load("res://Scenes/NeutralEnemy.tscn")
	MagicEnemy = load("res://Scenes/MagicEnemy.tscn")
	PhysicalEnemy = load("res://Scenes/PhysicalEnemy.tscn")
	done_spawning = true

#func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	pass

func Spawn(Type):
	var Clone
	if (Type == 3):
		Clone = MagicEnemy.instance()
	elif(Type == 2):
		Clone = PhysicalEnemy.instance()
	else:
		Clone = NeutralEnemy.instance()
	Root_Node.add_child(Clone)
	var size = Board_Node.board_size
	Clone.set_translation(Vector3(0, 0, 0))
	Board_Node.ignore_list.append(Clone.get_node("Area"))

func SpawnWave(T):
	done_spawning = false
	for i in range(0,T):
		while(get_tree().paused == true):
			yield(get_tree().create_timer(0.5), "timeout")
		num = randi()%3+1
		Spawn(num)
		yield(get_tree().create_timer(1.0), "timeout")
	done_spawning = true

