extends Control

func _ready():
	pass


func _on_Play_pressed():
	var _target = get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	$AudioStreamPlayer2D.stop()
	get_tree().quit()
