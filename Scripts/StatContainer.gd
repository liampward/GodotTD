extends Control

var root_node
var board_node


func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")
	

func _process(delta):
	if board_node.selected_tile != null and board_node.selected_tile.tower != null:
		var T = board_node.selected_tile.tower
		var damCap = max(1, min(5, T.damage / 5.6))		
		var rangCap = max(1, min(5, T.fireRange / 1.5))
		var rateCap = round(max(1, min(5, (1 / T.fireRate) * 2.45)))
		
		var i = 0
		for d in $DamageGrid.get_children():
			if i < damCap:
				d.get_child(0).play("on")
			else:
				d.get_child(0).play("default")
			i += 1
		i = 0
		for d in $RangeGrid.get_children():
			if i < rangCap:
				d.get_child(0).play("on")
			else:
				d.get_child(0).play("default")
			i += 1
		i = 0
		for d in $FireRateGrid.get_children():
			if i < rateCap:
				d.get_child(0).play("on")
			else:
				d.get_child(0).play("default")
			i += 1
		$Name.text = T.stackName


#		$Range.text = str(board_node.selected_tile.tower.fireRange)
#		$FireRate.text = str(board_node.selected_tile.tower.fireRate)
#		$Damage.text = str(board_node.selected_tile.tower.damage)
#		$Name.text = board_node.selected_tile.tower.stackName
	else:
		for d in $DamageGrid.get_children():
			d.get_child(0).play("default")		
		for d in $RangeGrid.get_children():
			d.get_child(0).play("default")
		for d in $FireRateGrid.get_children():
			d.get_child(0).play("default")
		$Name.text = ""