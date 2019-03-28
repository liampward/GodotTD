extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if(Global.Wave_Count == 1):
		self.text = str(Global.Wave_Count) + " round"
	else:
		self.text = str(Global.Wave_Count) + " rounds"

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
