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
var timer

func _ready():
	Root_Node = get_tree().get_root().get_node("Root")
	Board_Node = Root_Node.get_node("Board")
	NeutralEnemy = load("res://Scenes/NeutralEnemy.tscn")
	MagicEnemy = load("res://Scenes/MagicEnemy.tscn")
	PhysicalEnemy = load("res://Scenes/PhysicalEnemy.tscn")
	done_spawning = true
	timer = 0.0

func _process(delta):
	timer = timer - delta
	if (timer < 0.0):
		timer = 0.0

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
		while(timer > 0.0):
			yield(get_tree().create_timer(0.1), "timeout")
		num = randi()%3+1
		Spawn(num)
		timer = 1.0
	done_spawning = true

