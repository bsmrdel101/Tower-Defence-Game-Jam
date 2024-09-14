extends Sprite2D

@export var cooldown = 5.0

@onready var projectile = load("res://projectile.tscn")
@onready var shoot_timer = $ShootTimer
@onready var enemy = get_tree().get_first_node_in_group("enemy")

var is_ready = false

func _ready():
	shoot_timer.start(cooldown)
	
func _process(delta):
	if shoot_timer.is_stopped() and is_ready:
		if enemy == null:
			enemy = get_tree().get_first_node_in_group("enemy")
		elif !enemy.is_dead():
			shoot_at(enemy)
			shoot_timer.start(cooldown)

func shoot_at(enemy):
	var cannon_ball = projectile.instantiate()
	add_child(cannon_ball)
	cannon_ball.add_to_group("fire_ball")
	cannon_ball.direction = global_position.direction_to(enemy.global_position)
	cannon_ball.global_position = global_position

func _on_area_2d_area_entered(area):
	is_ready = true
