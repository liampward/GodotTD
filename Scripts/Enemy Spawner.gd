extends Spatial

var Root_Node
var Board_Node

var NeutralEnemy
var MagicEnemy
var PhysicalEnemy

var done_spawning
var timer

var spawn_neut = 0
var spawn_mag = 0
var spawn_phys = 0
var stat_scale = 1

var spawn_configuration

func _ready():
	Root_Node = get_tree().get_root().get_node("Root")
	Board_Node = Root_Node.get_node("Board")
	NeutralEnemy = load("res://Scenes/NeutralEnemy.tscn")
	MagicEnemy = load("res://Scenes/MagicEnemy.tscn")
	PhysicalEnemy = load("res://Scenes/PhysicalEnemy.tscn")
	
	spawn_configuration = File.new()
	spawn_configuration.open("res://media/SpawnConfiguration.txt",1)
	
	done_spawning = true
	timer = 0.0

func _process(delta):
	timer = timer - delta
	if (timer < 0.0):
		if(spawn_neut > 0):
			Spawn(1)
			spawn_neut -= 1
		elif(spawn_phys > 0):
			Spawn(2)
			spawn_phys -= 1
		elif(spawn_mag > 0):
			Spawn(3)
			spawn_mag -= 1
		timer = 1.0
	if(spawn_neut == 0 and spawn_phys == 0 and spawn_mag == 0):
		done_spawning = true

func Spawn(Type):
	var Clone
	if (Type == 3):
		Clone = MagicEnemy.instance()
		Clone.type = 3
	elif(Type == 2):
		Clone = PhysicalEnemy.instance()
		Clone.type = 2
	else:
		Clone = NeutralEnemy.instance()
		Clone.type = 1
	Clone.hp_max *= stat_scale
	Clone.hp_cur = Clone.hp_max 
	Root_Node.add_child(Clone)
	Clone.set_translation(Vector3(1, 0, 11))
	Clone.move_to(Vector3(33, 0, 10))
	
func ParseWave():
	done_spawning = false
	var line = spawn_configuration.get_line()
	line = line.split(",")
	if(line.size() == 4):
		stat_scale = float(line[3])
		spawn_neut = int(line[0])
		spawn_phys = int(line[1])
		spawn_mag = int(line[2])
	

