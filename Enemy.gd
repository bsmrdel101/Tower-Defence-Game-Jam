extends PathFollow2D

@export var speed: int = 15
@export var health: int = 100
@export var damage: int = 2
@export var gold: int = 10

func set_pos(pos: Vector2):
	position.x = pos.x
	position.y = pos.y

func take_damage(amount: int):
	health -= amount

func slow_down():
	speed = 7

func is_dead() -> bool:
	if health <= 0:
		return true
	return false

func _process(delta):
	set_progress(get_progress() + speed * delta)
	if is_dead():
		get_node("/root/Game").emit_signal("player_gain_gold", gold)
		queue_free()

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("cannon_ball"):
		take_damage(20)
	if area.get_parent().is_in_group("fire_ball"):
		take_damage(50)
	if area.get_parent().is_in_group("ice_ball"):
		slow_down()
