extends Node2D

signal player_take_damage(dmg)
signal player_gain_gold(value)
signal player_spend_gold(value)

@export_category("Starting Values")
@export var health = 20
@export var gold = 50


func _on_player_take_damage(dmg):
	health -= dmg
	var health_text = get_node("/root/Game/HUD/TopBar/HBoxContainer/HealthContainer/HealthText")
	health_text.text = "%s" % health
	if (health <= 0):
		get_node("./HUD/GameOverUI").visible = true

func _on_player_gain_gold(value):
	gold += value
	var gold_text = get_node("/root/Game/HUD/TopBar/HBoxContainer/GoldContainer/GoldText")
	gold_text.text = "%s" % gold

func _on_player_spend_gold(value):
	gold -= value
	var gold_text = get_node("/root/Game/HUD/TopBar/HBoxContainer/GoldContainer/GoldText")
	gold_text.text = "%s" % gold
