extends Node

var money
var health

func _ready():
	money = 100;
	health = 10;

	#OS.set_window_fullscreen(true)

func _process(delta):
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()

