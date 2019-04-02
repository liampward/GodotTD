extends MeshInstance

var new_matl = SpatialMaterial.new()
var old_matl
var tower = null
var selected = false
var moved = false

func _ready():
	old_matl = get_surface_material(0)
	new_matl.emission_enabled = true
	new_matl.emission = Color(0.1, 0.8, 0.1)

# This should be replaced with a signal
func _process(delta):
	if selected and not moved:
		translation.y += 0.3
		set_surface_material(0, new_matl)
		moved = true
	if moved and not selected:
		translation.y -= 0.3
		set_surface_material(0, old_matl)
		moved = false
