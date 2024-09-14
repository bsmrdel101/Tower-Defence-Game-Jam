extends Node2D

@export var speed: int = 15
@export var health: int = 100

func set_pos(pos: Vector2):
	position.x = pos.x
	position.y = pos.y

func take_damage(amount: int):
	health -= amount

func slow_down():
	speed = 5

func is_dead() -> bool:
	if health <= 0:
		return true
	return false

func _process(delta):
	var path = get_parent()
	path.set_progress(path.get_progress() + speed * delta)
	if is_dead():
		# add points
		queue_free()

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("cannon_ball"):
		take_damage(30)
	if area.get_parent().is_in_group("fire_ball"):
		take_damage(50)
	if area.get_parent().is_in_group("ice_ball"):
		slow_down()
