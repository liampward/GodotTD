extends Panel

var displaying = false

func display_text(text):
	displaying = true
	self.visible = true
	$Label.text = text
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	yield(get_tree().create_timer(0.5), "timeout")
	self.visible = false