extends Spatial
signal intruder

export onready var price = 10

var damage = 10
var fireRange = 1
var fireRate = 1
var interval = fireRate
var canFire = true
var upgradeLevel = 0;
var Stack = []
var targs = []

var BULLET = preload("res://Scenes/Bullet.tscn")
var MAGIC = preload("res://Scenes/magicTower.tscn")
var PHYSICAL = preload("res://Scenes/physTower.tscn")
var NEUTRAL = preload("res://Scenes/baseTower.tscn")

func _ready():
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
		
	

func _process(delta):
	if !canFire:
		interval -= delta
		if interval <= 0:
			interval = fireRate
			canFire = true
	if(len(targs) != 0 && canFire):
		attack(targs[0].get_parent())

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
		if num == 2:
			#Neutral Tower
			tower = PHYSICAL.instance()
		if num == 3:
			#Magic Tower
			tower = MAGIC.instance()

			
		tower.set_translation(self.get_node("UpgradePoint").get_translation())
		tower.translate(Vector3(0, 1.3, 0) * upgradeLevel)
		self.add_child(tower)
		Stack.append(tower)
		var root_node = get_tree().get_root().get_node("Root")
		var board_node = root_node.get_node("Board")
		upgradeLevel += 1
		
		