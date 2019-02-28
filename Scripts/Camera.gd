extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var canMove;
var rotate = Vector3(0, 0, 0);
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if canMove:
		if rotate.y != 0:
			self.get_parent().rotate_y(rotate.y * delta);


func _input(event):
	if event is InputEventMouseButton && event.button_index == 3:
			canMove = !canMove;
	if event is InputEventMouseMotion && canMove:
		var change  = event.relative
		rotate = Vector3(change.y, change.x, 0)