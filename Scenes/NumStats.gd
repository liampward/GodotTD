extends CheckButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	self.pressed = false

func _toggled(button_pressed):
	Global.numericStats = !Global.numericStats