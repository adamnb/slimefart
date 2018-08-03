# TODO: Turn linear charging to exponential
extends RigidBody2D

var spt
var chargeBar

var spriteSize = Vector2(0, 0)

export(bool) var oobLoop = true # Loop to other side on out of bounds?

export(float) var maxForce = 10.0
export(float) var chargeRate = 0.5
var charge = 0

func _ready():
	spt = $Sprite
	chargeBar = $ChargeBar
	
	spriteSize = spt.region_rect.size
	print (spriteSize)
	set_physics_process(true)
#END _ready

var prevDir = Vector2(0, 0) # Upon release, the current direction is almost always zero
func _physics_process(delta):
	# Direction
	var dirx = 0
	if Input.is_action_pressed("kb_left"): dirx = -1;
	elif Input.is_action_pressed("kb_right"): dirx = 1;
	else: dirx = 0;
		
	var diry = 0
	if Input.is_action_pressed("kb_up"): diry = -1;
	elif Input.is_action_pressed("kb_down"): diry = 1;
	else: diry = 0;
	
	var direction = Vector2(dirx, diry)
	spt.direction = direction
	
	# MOVEMENT
	# - charging
	if (Input.is_action_pressed("kb_direction")): # If any directional key is pressed
		if (charge < 1):
			charge += chargeRate * delta
			print ("Charging! ", charge)

		else:
			print ("Max charge reached!")
			charge = 1
	
	# - charge release
	if (Input.is_action_just_released("kb_direction")): # When a directional key is released
		print ("DIRECTION: ", prevDir)
		print ("RELEASED! with a force of ", charge * maxForce)
		
		if charge > 0.25: spt.flash();
			
		apply_impulse(Vector2(0, 0),
			Vector2(prevDir.x * charge * maxForce, prevDir.y * charge * maxForce))
		charge = 0
	
	#GUI
	chargeBar.value = charge
	
	prevDir = direction
#END _process