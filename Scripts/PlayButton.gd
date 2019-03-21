extends Button

func _ready():
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_real_window_size()

	OS.set_window_position(screen_size*0.5 - window_size*0.5)

func _pressed():
	get_tree().change_scene("res://Scenes/Root.tscn")

