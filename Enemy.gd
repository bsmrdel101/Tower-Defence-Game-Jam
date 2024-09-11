extends Node2D

@export var speed: int = 500
@export var health: int = 100

@onready var progress = $Path2D/PathFollow2D

func set_pos(pos: Vector2):
	position.x = pos.x
	position.y = pos.y

func take_damage(amount: int):
	health -= amount

func is_dead() -> bool:
	if health <= 0:
		return true
	return false

func _ready():
	progress.loop = false
	progress.set_progress(0.0)

func _process(delta):
	if progress.get_progress() != 1:
		progress.set_progress(progress.get_progress() + speed * delta)
		position.x = progress.position.x
		position.y = progress.position.y
