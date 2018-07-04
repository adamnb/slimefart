extends Sprite

var direction = Vector2(0, 0);

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