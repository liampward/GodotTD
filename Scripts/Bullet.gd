extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var damage = 2;
var speed = 5;
var velocity = Vector3(1,0,0);

func move(delta):
	translation += speed * velocity * delta;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	move(delta)
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
