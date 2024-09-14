extends Sprite2D

@export var cooldown = 2.0
@export var range = 100

@onready var projectile = load("res://projectile.tscn")
@onready var shoot_timer = $ShootTimer
@onready var enemy = get_tree().get_first_node_in_group("enemy")


func _ready():
	shoot_timer.start(cooldown)
	
func _process(delta):
	enemy = get_closest_enemy()
	if shoot_timer.is_stopped() and enemy and is_enemy_in_range(enemy) and !enemy.is_dead():
		shoot_at(enemy)
		shoot_timer.start(cooldown)

func is_enemy_in_range(enemy):
	return global_position.distance_to(enemy.global_position) <= range

func get_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() == 0:
		return null
	var closest_enemy = enemies[0]
	for enemy in enemies:
		if is_enemy_in_range(enemy) and global_position.distance_to(enemy.global_position) < global_position.distance_to(closest_enemy.global_position):
			closest_enemy = enemy
	return closest_enemy

func shoot_at(enemy):
	var ice_ball = projectile.instantiate()
	add_child(ice_ball)
	ice_ball.add_to_group("ice_ball")
	ice_ball.direction = global_position.direction_to(enemy.global_position)
	ice_ball.global_position = global_position
