extends Button

func _pressed():
	var menu = get_node("../OptionsMenu")
	menu.visible = !menu.visible
