extends Node2D

@export var speed: int = 15
@export var health: int = 100

func set_pos(pos: Vector2):
	position.x = pos.x
	position.y = pos.y

func take_damage(amount: int):
	health -= amount

func is_dead() -> bool:
	if health <= 0:
		return true
	return false

func _process(delta):
	var path = get_parent()
	path.set_progress(path.get_progress() + speed * delta)
	print(health)
	if is_dead():
		# add points
		queue_free()

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("cannon_ball"):
		take_damage(30)
