extends Area2D


func _on_area_entered(area):
	var parent = area.get_parent()
	if parent and parent.is_in_group("enemy"):
		get_node("/root/Game").emit_signal("player_take_damage", 3)
		parent.queue_free()
