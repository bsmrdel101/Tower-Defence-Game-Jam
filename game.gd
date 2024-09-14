extends Node2D

signal player_take_damage(dmg)
signal player_gain_gold(value)
signal player_spend_gold(value)

var health = 20
var gold = 50

@onready var start_timer = $StartTimer
@onready var enemy_scene = load("res://enemy.tscn")
@onready var enemy_path = load("res://enemy_path.tscn")

func _ready():
	start_timer.start(3)

func _process(delta):
	if start_timer.is_stopped():
		var enemy_path = enemy_path.instantiate()
		var enemy_scene = enemy_scene.instantiate()
		get_node("/root/Game/Level1/Path2D").add_child(enemy_path)
		start_timer.start(3)
	
func _on_player_take_damage(dmg):
	health -= dmg
	if (health <= 0):
		get_node("./HUD/GameOverUI").visible = true

func _on_player_gain_gold(value):
	gold += value


func _on_player_spend_gold(value):
	gold -= value
