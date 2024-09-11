extends Area2D


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed == false:
		get_node("/root/Game/HUD/BuildUI").visible = true
