extends MarginContainer

signal selected_tower_location(pos)

var tower_position


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
	tower.position = tower_position
	get_node("/root/Game/Level1").add_child(tower)


func close_ui():
	get_node("/root/Game/HUD/BuildUI").visible = false


func _on_selected_tower_location(pos):
	tower_position = pos
