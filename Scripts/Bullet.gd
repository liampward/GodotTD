extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var damage = 100
var speed = 5
var dir
var target

func move(delta):
	dir = self.get_translation() - target.get_translation()
	translation += speed * dir * delta;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	move(delta)

