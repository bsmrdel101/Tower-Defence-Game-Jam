extends Control

const GAME_SCENE = "res://game.tscn"

func _on_start_button_pressed():
	SceneManager.change_scene(GAME_SCENE)

func _on_close_button_pressed():
	get_tree().quit()
