extends Panel

func _on_exit_button_pressed():
	get_tree().quit()

func _on_main_menu_btn_pressed():
	get_tree().paused = false
	SceneManager.change_scene("res://main_menu.tscn")

func _on_resume_button_pressed():
	visible = false
	get_tree().paused = false
