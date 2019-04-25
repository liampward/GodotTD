extends HSlider

func _ready():
	get_tree().call_group("MUSIC", "set_volume_db", Global.music_volume)
	if(Global.music_volume < self.value):
		self.value = Global.music_volume

func _gui_input(event):
	Global.music_volume = self.value
	get_tree().call_group("MUSIC", "set_volume_db", self.value)