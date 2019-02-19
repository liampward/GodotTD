extends MeshInstance

export onready var hp = 10
export onready var speed = 5

func _ready():
	pass

func _process(delta):
	translation += Vector3(1, 0, 0) * speed * delta;
