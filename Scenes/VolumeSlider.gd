extends HSlider

func _ready():
	Global.volume = self.max_value

func _gui_input(event):
	Global.volume = self.value