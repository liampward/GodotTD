extends Spatial
signal intruder

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var BULLET

export onready var price = 5

var interval = 5
var canFire = true


func _ready():
	preload("res://Scripts/Bullet.gd")
	BULLET = preload("res://Scenes/Bullet.tscn")
	
func attack(enemy):
	if canFire:
		self.get_node("AudioStreamPlayer").play()
		var bullet = BULLET.instance()
		bullet.set_name("myBullet")
		bullet.set_translation(self.get_translation())
		bullet.dir = enemy.get_global_transform().origin - self.get_global_transform().origin  
		bullet.dir.y = 0
		bullet.dir = bullet.dir.normalized()
		get_parent().add_child(bullet)
		var root_node = get_tree().get_root().get_node("Root")
		var board_node = root_node.get_node("Board")
		board_node.ignore_list.append(bullet.get_node("Area"))
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
		attack(badGuy.get_parent());
	#emit_signal("intruder")
	#attack();
	pass # replace with function body