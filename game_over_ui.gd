extends MarginContainer

func _on_retry_btn_pressed():
	SceneManager.change_scene("res://level1.tscn")

func _on_main_menu_btn_pressed():
	SceneManager.change_scene("res://main_menu.tscn")
