extends MeshInstance

const MOVE_SPEED = 5

var hp_max = 100.0
var hp_cur = hp_max

var matl = SpatialMaterial.new()

func _ready():
	self.set_material_override(matl)
	matl.albedo_color = Color(1, 0, 0)

func _process(delta):
	#translation += Vector3(1, 0, 0) * MOVE_SPEED * delta

	if hp_cur <= 0:
		queue_free()
		# TODO add money to player's balance

func hurt(dmg):
	hp_cur -= dmg
	matl.albedo_color = Color(hp_cur / hp_max, 0, 0)
