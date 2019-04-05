extends Node

var money
var health
var wave_num
var board_node
var button1
var button2
var button3

func _ready():
	money = 10000
	health = 10
	wave_num = 0
	
	board_node = self.get_node("Board")
	button1 = self.get_node("MainPanel/DetailPanel/UpgradeSelect1")
	button2 = self.get_node("MainPanel/DetailPanel/UpgradeSelect2")
	button3 = self.get_node("MainPanel/DetailPanel/UpgradeSelect3")


func _process(delta):
	Global.Wave_Count = wave_num
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
	if(Input.is_action_just_pressed("UPGRADE1")):
		button1._pressed()
	if(Input.is_action_just_pressed("UPGRADE2")):
		button2._pressed()
	if(Input.is_action_just_pressed("UPGRADE3")):
		button3._pressed()
	if(health <= 0):
		get_tree().change_scene("res://Scenes/GameOver.tscn")