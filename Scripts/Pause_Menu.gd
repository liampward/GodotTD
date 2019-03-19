extends ColorRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(Input.is_action_just_pressed("PAUSE")):
		self.visible = !self.visible
		get_tree().paused = !get_tree().paused

