extends HSlider

func _ready():
	if(Global.volume < self.max_value):
		self.value = Global.volume
	else:
		Global.volume = self.max_value

func _gui_input(event):
	Global.volume = self.value