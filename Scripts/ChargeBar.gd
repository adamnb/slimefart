# TODO: Make bar bottom-up
extends Node2D

export(Color) var maskColor = Color(0, 0, 0)
export(Color) var barColor = Color(1, 0, 0)

var value = 0.0

func _process(delta):
	update()

func _draw():
	print ("draw")
	
	draw_rect(Rect2(0, 0, 4, 12), maskColor)
	draw_rect(Rect2(1, 1, 2, 10 * value), barColor)
	
