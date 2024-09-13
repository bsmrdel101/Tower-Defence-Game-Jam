extends Node2D

signal player_take_damage(dmg)
signal player_gain_gold(value)
signal player_spend_gold(value)

var health = 20
var gold = 50
	

func _on_player_take_damage(dmg):
	health -= dmg
	if (health <= 0):
		get_node("./HUD/GameOverUI").visible = true


func _on_player_gain_gold(value):
	gold += value


func _on_player_spend_gold(value):
	gold -= value
