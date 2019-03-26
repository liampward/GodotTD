extends Node

var money
var health
var wave_num
var board_node
var script

func _ready():
	money = 100
	health = 10
	wave_num = 0
	
#	board_node = self.get_node("Board")
#	var tower_script = load("res://Scripts/TowerPurchase.gd")
#	script = tower_script.new()


func _process(delta):
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
#	if(Input.is_key_pressed(KEY_1)):
#		if board_node.selected_tile.tower != null:
#			script.upgrade(1)
#		if board_node.selected_tile.tower == null:
#			script.purchase("NEUTRAL")
