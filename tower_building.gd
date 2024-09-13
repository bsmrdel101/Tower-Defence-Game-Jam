extends MarginContainer

signal selected_tower_location(col)

var build_area


func _on_build_cannon_btn_pressed():
	build_tower("cannon")
	close_ui()


func _on_build_ice_btn_pressed():
	build_tower("ice")
	close_ui()


func _on_build_fire_btn_pressed():
	build_tower("fire")
	close_ui()


func build_tower(type: String):
	var tower_scene = load("res://{tower}_tower.tscn".format({"tower": type}))
	var tower = tower_scene.instantiate()
	var parent_node = get_node("/root/Game/Level1")
	var local_tower_position = parent_node.to_local(build_area.global_position)
	tower.position = local_tower_position
	parent_node.add_child(tower)
	build_area.queue_free()


func close_ui():
	get_node("/root/Game/HUD/BuildUI").visible = false


func _on_selected_tower_location(col):
	build_area = col
