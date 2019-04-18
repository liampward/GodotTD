extends CheckButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.pressed = OS.window_fullscreen

func _toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
