extends MarginContainer

func _on_retry_btn_pressed():
	get_tree().change_scene_to_file("res://level1.tscn")


func _on_main_menu_btn_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
