extends RigidBody2D

var spt

export(float) var maxForce = 10.0
var charge = 0
export(float) var chargeRate = 0.5

func _ready():
	spt = $Sprite
	set_process(true)

var prevDir = Vector2(0, 0)
func _process(delta):
	
	var dirx = 0
	if Input.is_action_pressed("kb_left"): 
		dirx = -1 
	elif Input.is_action_pressed("kb_right"):
		dirx = 1
	else:
		dirx = 0
		
	var diry = 0
	if Input.is_action_pressed("kb_up"): 
		diry = -1 
	elif Input.is_action_pressed("kb_down"):
		diry = 1
	else:
		diry = 0
	
	var direction = Vector2(dirx, diry)
	spt.direction = direction
	
	if (Input.is_action_pressed("kb_direction")): # If any directional key is pressed
		if (charge < 1):
			charge += chargeRate * delta
			print ("Charging! ", charge)

		else:
			print ("Max charge reached!")
			charge = 1

	if (Input.is_action_just_released("kb_direction")):
		print ("DIRECTION: ", prevDir)
		print ("RELEASED! with a force of ", charge * maxForce)
		apply_impulse(Vector2(0, 0),
			Vector2(prevDir.x * charge * maxForce, prevDir.y * charge * maxForce))
		charge = 0
	
	prevDir = direction 
#END _process