extends Sprite2D

@export var cooldown = 3.0
@export var range = 200

@onready var projectile = load("res://projectile.tscn")
@onready var shoot_timer = $ShootTimer
@onready var enemy = get_tree().get_first_node_in_group("enemy")


func _ready():
	shoot_timer.start(cooldown)
	
func _process(delta):
	enemy = get_tree().get_first_node_in_group("enemy")
	if shoot_timer.is_stopped() and enemy and is_enemy_in_range() and !enemy.is_dead():
		shoot_at(enemy)
		shoot_timer.start(cooldown)

func is_enemy_in_range():
	return global_position.distance_to(enemy.global_position) <= range

func shoot_at(enemy):
	var fire_ball = projectile.instantiate()
	add_child(fire_ball)
	fire_ball.add_to_group("fire_ball")
	fire_ball.direction = global_position.direction_to(enemy.global_position)
	fire_ball.global_position = global_position
