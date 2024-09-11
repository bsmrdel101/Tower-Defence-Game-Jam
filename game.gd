extends Node2D

var enemy = load("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var zombie = enemy.instantiate()
	add_child(zombie)
	zombie.z_index = 10
	zombie.set_pos($SpawnerMarker.position)
	print("testing")
