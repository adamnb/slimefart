extends Node2D

var winDim = get_viewport_rect().size # Dimensions of the window

func _ready():
	print ("WINDOW\nW: ", winDim.x, " | H: ", winDim.y);
	
func _draw():
	
	
	