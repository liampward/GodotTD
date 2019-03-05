extends Node

enum Mode{ NONE, SELL, BUY }

var money;
var mode;
var selected;
var health;

func _ready():
	money = 100;
	health = 10;
	mode = Mode.NONE;
	selected = null;
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_real_window_size()

	OS.set_window_position(screen_size*0.5 - window_size*0.5)

	#OS.set_window_fullscreen(true)

func _process(delta):
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
