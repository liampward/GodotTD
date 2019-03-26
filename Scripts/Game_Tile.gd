extends MeshInstance

# class member variables go here, for example:
# var a = 2
var matl = SpatialMaterial.new()
var old_matl
var tower = null
var selected = false
var moved = false


func _ready():
	old_matl = self.get_surface_material(0)
	#matl.albedo_color = Color(0.4, 0.7, 0.4)
	matl.emission_enabled = true
	matl.emission = Color(0.13, 0.8, 0.13)
	matl.emission_energy = 1
	
func _process(delta):
	if selected == true and moved == false:
		self.translation.y += 0.3
		self.set_surface_material(0, matl)
		moved = true
	if selected == false and moved == true:
		self.translation.y -= 0.3
		self.set_surface_material(0, old_matl)
		moved = false