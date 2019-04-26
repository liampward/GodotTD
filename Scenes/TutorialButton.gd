extends Button

func _pressed():
	get_node("../TutorialScreen").visible = !get_node("../TutorialScreen").visible