extends Area2D


func _on_area_entered(area):
	if area.get_parent() and area.get_parent().is_in_group("enemy"):
		get_node("/root/Game").emit_signal("player_take_damage", 3)
