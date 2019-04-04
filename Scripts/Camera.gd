extends Camera

var canMove;
var rotate = Vector2(0, 0);

func _ready():
	pass

func _process(delta):
	if canMove:
		self.get_parent().rotate_x(rotate.y * delta);
		self.get_parent().get_parent().rotate_y(rotate.x * delta);
		
	rotate = Vector2(0, 0)

func _input(event):
	if event is InputEventMouseButton && event.button_index == 3:
			canMove = !canMove;
	if event is InputEventMouseMotion && canMove:
		rotate = event.relative * 1.5