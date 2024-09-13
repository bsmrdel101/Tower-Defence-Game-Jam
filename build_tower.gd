extends Area2D


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed == false:
		get_node("/root/Game/HUD/BuildUI").visible = true
		var tower_builder = get_node("/root/Game/HUD/BuildUI/Panel/TowerOptions")
		tower_builder.selected_tower_location.emit(get_node("CollisionShape2D"))
