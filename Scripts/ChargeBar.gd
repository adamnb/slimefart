extends Node2D

export(Color) var maskColor = Color(0, 0, 0)
export(Color) var lowColor = Color(1, 0, 0)
export(Color) var highColor = Color(0, 1, 0)
var colDiff = Vector3(0, 0, 0)
var barColor = Color(0, 0, 0)

var value = 0.0 # This value is always restrained between 0-1

func _ready():
	colDiff = Vector3(highColor.r - lowColor.r,
		highColor.g - lowColor.g,
		highColor.b - lowColor.b)

	print ("[CHARGE BAR] Color Diff: ", colDiff)

func _process(delta):
	update()

func _draw():
	barColor = Color(lowColor.r + colDiff.x * value, # Adjusting bar color over value
		lowColor.g + colDiff.y * value,
		lowColor.b + colDiff.z * value)

	draw_rect(Rect2(0, 0, 4, 12), maskColor)
	draw_rect(Rect2(1, 11, 2, 10 * -value), barColor)
