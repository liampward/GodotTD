extends HSlider

func _ready():
	get_tree().call_group("MUSIC", "set_volume_db", self.value)

func _gui_input(event):
	get_tree().call_group("MUSIC", "set_volume_db", self.value)