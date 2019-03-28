extends Spatial
signal intruder

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var BULLET
var MAGIC
var PHYSICAL
var NEUTRAL

enum Tower {NEUT,PHYS,MAG}

export onready var price = 10
export onready var type = NEUT

var damage = 10
var fireRange = 1
var fireRate = 1
var interval = fireRate
var canFire = true
var upgradeLevel = 0;

var Stack = []
var targs = []

func _ready():
	preload("res://Scripts/Bullet.gd")
	BULLET = preload("res://Scenes/Bullet.tscn")
	MAGIC = preload("res://Scenes/magicTower.tscn")
	PHYSICAL = preload("res://Scenes/physTower.tscn")
	NEUTRAL = preload("res://Scenes/baseTower.tscn")
	$Area.connect("area_entered", self, "_on_Area_area_entered")
	$Area.connect("area_exited", self, "_on_Area_area_exited")
	
func attack(enemy):
	if canFire:
		self.get_node("AudioStreamPlayer").play()
		var bullet = BULLET.instance()
		bullet.set_name("myBullet")
		bullet.set_translation(self.get_translation())
		bullet.targ = weakref(enemy)
		bullet.dir = enemy.get_global_transform().origin - self.get_global_transform().origin  
		bullet.dir.y = 0
		bullet.dir = bullet.dir.normalized()
		bullet.damage = damage
		self.add_child(bullet)
		var root_node = get_tree().get_root().get_node("Root")
		var board_node = root_node.get_node("Board")
		canFire = false
		
	

func setType(type):
	self.type = type
	if type == NEUT:
		print("Made a Neutral")
		pass
	elif self.type == MAG:
		print("Made a Magic")
		pass
	elif self.type == PHYS:
		print("Made a Physical")
		pass
	else:
		print("ERROR: Unrecognized type!")

func _process(delta):
	if !canFire:
		interval -= delta
		if interval <= 0:
			interval = fireRate
			canFire = true
	for i in range(len(targs)):
		if targs[i].get_parent().is_in_group("ENEMY"):
			attack(targs[i].get_parent())
			break

func _on_Area_area_entered(badGuy):
	if badGuy.get_parent().is_in_group("ENEMY"):
		targs.append(badGuy)
		
func _on_Area_area_exited(badGuy):
	if badGuy.get_parent().is_in_group("ENEMY"):
		targs.remove(targs.find(badGuy))
	
func upgrade(num):
	price += 10
	if upgradeLevel < 2:
		var tower
		if num == 1:
			#Neutral Tower
			tower = NEUTRAL.instance()
			tower.setType(NEUT)
		if num == 2:
			#Neutral Tower
			tower = PHYSICAL.instance()
			tower.setType(PHYS)
		if num == 3:
			#Magic Tower
			tower = MAGIC.instance()
			tower.setType(MAG)

			
		tower.set_translation(self.get_node("UpgradePoint").get_translation())
		tower.translate(Vector3(0, 1.3, 0) * upgradeLevel)
		self.add_child(tower)
		Stack.append(tower)
		var root_node = get_tree().get_root().get_node("Root")
		var board_node = root_node.get_node("Board")
		upgradeLevel += 1
		
		