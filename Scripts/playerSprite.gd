extends Sprite

var direction = Vector2(0, 0)

export(bool) var flashing = false
export(float) var flash_dur = 0.1
var flash_curT = 0.0

func _ready():
	set_process(true)

func _process(delta):
	if direction == Vector2(0, -1):
		region_rect.position.x = 0
	elif direction == Vector2(1, -1):
		region_rect.position.x = 12
	elif direction == Vector2(1, 0):
		region_rect.position.x = 24
	elif direction == Vector2(1, 1):
		region_rect.position.x = 36
	elif direction == Vector2(0, 1):
		region_rect.position.x = 48
	elif direction == Vector2(-1, 1):
		region_rect.position.x = 60
	elif direction == Vector2(-1, 0):
		region_rect.position.x = 72
	elif direction == Vector2(-1, -1):
		region_rect.position.x = 84
	else:
		region_rect.position.x = 96
		
	print (region_rect)
	
	if flashing:
		flash_curT -= delta
		region_rect.position.x = 108
		
		if flash_curT <= 0.0:
			flashing = false
	
func flash():
	flash_curT = flash_dur
	flashing = true
	
	
	
	
	
	