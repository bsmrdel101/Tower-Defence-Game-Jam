extends Button

func _on_pressed():
	get_node("/root/Game/HUD/PauseScreenUI").visible = true
	get_tree().paused = true
