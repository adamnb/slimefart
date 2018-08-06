extends RigidBody2D

# CONTROLS ####################################################################
# TODO: Add Gamepad/Keyboard toggle
var directionals = [0, 0, 0, 0] # Directional key states UDLR

# SPRITE ######################################################################
var spt
var spriteSize = Vector2(0, 0)

# CHARGING ####################################################################
var chargeBar
export(float) var maxForce = 10.0
export(float) var chargeRate = 0.5 # linear charge rate
export(float) var exChargeRate = 2 # Exponential charge rate
export(bool) var linear = false # Whether the charge progresses linearly or not
var charge = 0


func _ready():
	spt = $Sprite
	chargeBar = $ChargeBar
	
	spriteSize = spt.region_rect.size
	print (spriteSize)
	set_physics_process(true)


var prevDir = Vector2(0, 0) # Upon release, the current direction is almost always zero
var chargeTime = 0
func _physics_process(delta):

	# DIRECTION
	var dirx = 0
	if Input.is_action_pressed("kb_left"): 
		dirx = -1;  
		directionals[2] = 1;
	elif Input.is_action_pressed("kb_right"): 
		dirx = 1; 
		directionals[3] = 1;
	else: 
		dirx = 0;
		directionals[2] = 0
		directionals[3] = 0
		
	var diry = 0
	if Input.is_action_pressed("kb_up"): 
		diry = -1; 
		directionals[0] = 1;
	elif Input.is_action_pressed("kb_down"): 
		diry = 1; 
		directionals[1] = 1;
	else: 
		diry = 0;
		directionals[0] = 0
		directionals[1] = 0
	
	var direction = Vector2(dirx, diry)
	spt.direction = direction
	
	# MOVEMENT
	# - charging
	if (Input.is_action_pressed("kb_direction")): # If any directional key is pressed
		chargeTime += delta
		if (charge < 1):
			
			# Linear-exponential switch
			if (linear):
				charge += chargeRate * delta
				
			else: # Exponential charging over time
				charge += pow(chargeTime, exChargeRate)	
		else:
			charge = 1
	
	# - charge release
	if (directionals == [0, 0, 0, 0]):
		print ("DIRECTION: ", prevDir)
		print ("RELEASED! with a force of ", charge * maxForce)
		
		chargeTime = 0
		
		if charge > 0.25: spt.flash();
			
		apply_impulse(Vector2(0, 0),
			Vector2(prevDir.x * charge * maxForce, prevDir.y * charge * maxForce))
		charge = 0
	# GUI
	chargeBar.value = charge
	
	prevDir = direction