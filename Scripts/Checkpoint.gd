# TODO: Scene transition
extends Area2D

const PLAYERNAME = "Player"
export(String) var targetScene = "res://Scenes/Levels/TestScn2.tscn"

func _ready():
	connect ("body_entered", self, "bodyEnter");
	
func bodyEnter (body):
	if (body.name == PLAYERNAME):
		print ("A BLOODLESS BUFFOON HAS DARED TO ENTER MY DOMAIN, WHAT A FOOL.")
		print ("A scene transition is supposed to happen here")
		
		get_tree().change_scene(targetScene)
		