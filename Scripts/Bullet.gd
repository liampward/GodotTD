extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var damage = 100
var speed = 5
var dir
var lifetime = 20
var root_node
var board_node
var targ

func move(delta):
	if targ.get_ref():
		dir = targ.get_ref().get_global_transform().origin - self.get_global_transform().origin
		dir = dir.normalized()
	translation += (dir * speed * delta)
	lifetime -= delta
	if (lifetime <= 0):
		queue_free()
	
func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")

func _process(delta):
	move(delta)

