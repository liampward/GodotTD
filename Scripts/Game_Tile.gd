extends MeshInstance

# class member variables go here, for example:
# var a = 2
var tower = null
var selected = false
var moved = false


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _process(delta):
	if selected == true and moved == false:
		self.translation.y += 0.3
		self
		moved = true
	if selected == false and moved == true:
		self.translation.y -= 0.3
		moved = false