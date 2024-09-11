extends MarginContainer


func _on_build_cannon_btn_pressed():
	print("build cannon")
	close_ui()


func _on_build_ice_btn_pressed():
	print("build ice")
	close_ui()


func _on_build_fire_btn_pressed():
	print("build fire")
	close_ui()


func close_ui():
	get_node("/root/Game/HUD/BuildUI").visible = false
