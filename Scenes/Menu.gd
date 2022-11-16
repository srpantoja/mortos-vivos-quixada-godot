extends Control

func _on_btn_controllers_pressed():
	$Credits.visible = true
	$Controllers.visible = false
	$MainMenu.visible = false

func _on_btn_credits_pressed():
	$Controllers.visible = true
	$Credits.visible = false
	$MainMenu.visible = false

func _on_btn_return_pressed():
	$Credits.visible = false
	$Controllers.visible = false
	$MainMenu.visible = true

func _on_btn_play_pressed():
	get_tree().change_scene("res://Scenes/game.tscn")
	

