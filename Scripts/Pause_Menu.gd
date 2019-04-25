extends ColorRect

func _process(delta):
	if(Input.is_action_just_pressed("PAUSE")):
		self.visible = !self.visible
		$OptionsMenu.visible = false
		get_tree().paused = !get_tree().paused
		
