extends Particles

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()
	pass

func change_color(col):
	pass
