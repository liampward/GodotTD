extends Node

enum Mode{ NONE, SELL, BUY }

var money;
var mode;
var selected;

func _ready():
	money = 100;
	mode = Mode.NONE;
	selected = null;
	
	OS.set_window_fullscreen(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
