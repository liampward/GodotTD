extends Spatial

var root_node
var board_node
var towers = []

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	
	var button = root_node.get_node("./MainPanel/DetailPanel/UpgradeSelect1")
	button.connect("mouse_entered", self, "_on_button1_entered")
	button.connect("mouse_exited", self, "_on_button1_exited")
	button.connect("pressed", self, "_on_button_press1")
	
	button = root_node.get_node("./MainPanel/DetailPanel/UpgradeSelect2")
	button.connect("mouse_entered", self, "_on_button2_entered")
	button.connect("mouse_exited", self, "_on_button2_exited")
	button.connect("pressed", self, "_on_button_press2")
	
	button = root_node.get_node("./MainPanel/DetailPanel/UpgradeSelect3")
	button.connect("mouse_entered", self, "_on_button3_entered")
	button.connect("mouse_exited", self, "_on_button3_exited")
	button.connect("pressed", self, "_on_button_press3")
	
	towers.append($GhostNeut)
	towers.append($GhostPhys)
	towers.append($GhostMag)

func move_tower(type):
	if(board_node.selected_tile != null):
		if(board_node.selected_tile.tower == null):
			towers[type].set_translation(board_node.selected_tile.get_translation())
			towers[type].visible = true
		else:
			var tower = board_node.selected_tile.tower
			if(tower.upgradeLevel < 2):
				towers[type].set_global_transform(tower.Stack[tower.upgradeLevel].get_node("UpgradePoint").get_global_transform())
				towers[type].visible = true

func return_tower(type):
	towers[type].set_translation(Vector3(0,0,0))
	towers[type].visible = false
		
func _on_button1_entered():
	move_tower(0)
func _on_button2_entered():
	move_tower(1)
func _on_button3_entered():
	move_tower(2)

func _on_button1_exited():
	return_tower(0)
func _on_button2_exited():
	return_tower(1)
func _on_button3_exited():
	return_tower(2)
	
func _on_button_press1():
	return_tower(0)
	move_tower(0)
func _on_button_press2():
	return_tower(1)
	move_tower(1)
func _on_button_press3():
	return_tower(2)
	move_tower(2)
	