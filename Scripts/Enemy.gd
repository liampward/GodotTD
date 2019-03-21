extends MeshInstance

const MOVE_SPEED = 5

var hp_max = 100.0
var hp_cur = hp_max

var matl = SpatialMaterial.new()

var DEATH = preload("res://Scenes/EnemyDeathSound.tscn")
var particle_scene
var board_node
var root_node

func _ready():
	particle_scene = preload("res://Scenes/SmokeParticle.tscn")
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	self.set_material_override(matl)
	matl.albedo_color = Color(1, 0, 0)

func _process(delta):
	translation += Vector3(1, 0, 0) * MOVE_SPEED * delta

	if hp_cur <= 0:
		var deathSound = DEATH.instance()
		self.get_parent().add_child(deathSound)
		
		#MAKE SURE THIS LINE IS CALLED IF THE ENEMY EVER DIES!!!!
		board_node.ignore_list.remove(board_node.ignore_list.find($Area))
		
		queue_free()
		var particle_spawner = particle_scene.instance()
		get_parent().add_child(particle_spawner)
		particle_spawner.set_translation(self.get_translation() + Vector3(0, 3,0))
		var root_node = get_tree().get_root().get_node("Root")
		root_node.money += 10

func hurt(dmg):
	hp_cur -= dmg
	matl.albedo_color = Color(hp_cur / hp_max, 0, 0)


func _on_Area_area_entered(area):
	if area.get_parent().is_in_group("BULLET"):
		board_node.ignore_list.remove(board_node.ignore_list.find(area))
		area.get_parent().queue_free()
		hurt(area.get_parent().damage)
	elif (area.get_parent().name == "WALL"):
		root_node.health -= 1
		board_node.ignore_list.remove(board_node.ignore_list.find($Area))
		queue_free()

func _on_VisibilityNotifier_screen_exited():
	queue_free()
	var root_node = get_tree().get_root().get_node("Root")
	root_node.money += 10