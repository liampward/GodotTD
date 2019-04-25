extends Panel


func _ready():
	pass

func display_text(text):
	self.visible = true
	$Label.text = text
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	print(object)
	print(key)