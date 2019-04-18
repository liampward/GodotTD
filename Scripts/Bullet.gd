extends Spatial


var damage = 100
var speed = 30
var dir
var lifetime = 10
var root_node
var board_node
var targ
var type

func move(delta):
	if targ.get_ref():
		dir = targ.get_ref().get_global_transform().origin - self.get_global_transform().origin
		dir = dir.normalized()
		self.get_node("MeshInstance/Particles").look_at(targ.get_ref().get_global_transform().origin,Vector3(0,1,0))
	translation += (dir * speed * delta)
	lifetime -= delta
	if (lifetime <= 0):
		queue_free()
func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")


func _process(delta):
	move(delta)

