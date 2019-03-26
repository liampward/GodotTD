extends Control

var root_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")

func _process(delta):
	$Lives_num.text = str(root_node.health)
	$Money_num.text = str(root_node.money)
	$WaveCount.text = str(root_node.wave_num)
