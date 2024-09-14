extends Node2D

var speed = 100

var direction = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translate(direction * speed * delta)

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("enemy"):
		queue_free()
