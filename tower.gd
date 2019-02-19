extends Spatial

class Tower:
	var aggroDist
	var attackType
	var cost
	var effect
	var aoe
	#var upgradeTime
	#var paths
	
	func _ready():
		return
	
	func check():
		#If enemy is in range
		#Then call attack.
		return
	
	func attack():
		#Generate attack directed at closest detected enemy
		#Should there be some sort of attack class/enum?
		return
	
	#Maybe for a Tower/GameObject manager?
	func upgrade():
		#Create an instance of a tower from one of the upgrad paths in place of this instance
		#Delete this instance
		return

	func _process():
		return