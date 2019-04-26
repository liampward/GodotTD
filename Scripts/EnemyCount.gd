extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func set_count(neut, phys, mag):
	if((neut + phys + mag) == 0):
		get_node("../SpawnButton").visible = true
		self.visible = false
	$NumNeut.text = str(neut)
	$NumPhys.text = str(phys)
	$NumMag.text = str(mag)
