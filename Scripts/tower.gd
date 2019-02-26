extends Spatial
signal intruder

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var BULLET = preload("res://Scenes/Bullet.tscn")

export onready var price = 5

var interval = 5
var canFire = true


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	preload("res://Scripts/Bullet.gd")
	print("Turret Exists")
	pass
	
func attack():
	if canFire:
		var bullet = BULLET.instance()
		bullet.set_name("myBullet")
		bullet.set_translation(self.get_translation())
		get_parent().add_child(bullet)
		canFire = false
		
	

func _process(delta):
	if !canFire:
		interval -= delta
		if interval <= 0:
			interval = 5
			canFire = true
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area_area_entered(badGuy):
	if badGuy.get_parent().is_in_group("ENEMY"):
		attack();
	#emit_signal("intruder")
	#attack();
	pass # replace with function body