extends Control

var root_node
var board_node

func _ready():
	root_node = get_tree().get_root().get_node("Root")
	board_node = root_node.get_node("Board")


func _process(delta):
	if Global.numericStats == false:
		$IconStats.visible = true
		$NumberStats.visible = false
	else:
		$IconStats.visible = false
		$NumberStats.visible = true
	
	
	if board_node.selected_tile != null and board_node.selected_tile.tower != null:
		var T = board_node.selected_tile.tower
		var damCap = max(1, min(5, T.damage / 5.6))		
		var rangCap = max(1, min(5, T.fireRange / 1.5))
		var rateCap = round(max(1, min(5, (1 / T.fireRate) * 2.45)))
		
		var i = 0
		for d in $IconStats/DamageGrid.get_children():
			if i < damCap:
				d.get_child(0).play("on")
			else:
				d.get_child(0).play("default")
			i += 1
		i = 0
		for d in $IconStats/RangeGrid.get_children():
			if i < rangCap:
				d.get_child(0).play("on")
			else:
				d.get_child(0).play("default")
			i += 1
		i = 0
		for d in $IconStats/FireRateGrid.get_children():
			if i < rateCap:
				d.get_child(0).play("on")
			else:
				d.get_child(0).play("default")
			i += 1
		$Name.text = T.stackName
		$NumberStats/Range.text = str(T.fireRange)
		$NumberStats/FireRate.text = str(T.fireRate)
		$NumberStats/Damage.text = str(T.damage)

	else:
		for d in $IconStats/DamageGrid.get_children():
			d.get_child(0).play("default")		
		for d in $IconStats/RangeGrid.get_children():
			d.get_child(0).play("default")
		for d in $IconStats/FireRateGrid.get_children():
			d.get_child(0).play("default")
		$Name.text = ""
		$Name.text = ""
		$NumberStats/Range.text = ""
		$NumberStats/FireRate.text = ""
		$NumberStats/Damage.text = ""