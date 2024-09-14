extends Node

@onready var spawn_timer = $SpawnTimer
@onready var wave_end_timer = $WaveTimer
@onready var display_timer = get_node("/root/Game/HUD/Wave/Timer")
@onready var path = get_node("/root/Game/Level1/Path2D")
@onready var next_wave_btn = get_node("/root/Game/HUD/NextWaveContainer/VBoxContainer/NextWaveBtn")

@export_category("Wave Values")
@export var spawn_delay = 3
@export var wave_amount = 5
@export var enemies_per_wave: Array[int] = [8, 12, 14, 16, 20]
@export var enemies = [
	{ "enemy": null, "waveStart": 1 },
	{ "enemy": null, "waveStart": 2 },
	{ "enemy": null, "waveStart": 3 },
	{ "enemy": null, "waveStart": 4 }
]
var wave = 0
var spawned_enemies = 0
var wave_started = false
var level_complete = false

@export_category("References")
@export var goblin: PackedScene
@export var zombie: PackedScene
@export var evil_wizard: PackedScene
@export var skeleton: PackedScene


func _ready():
	enemies[0]["enemy"] = goblin
	enemies[1]["enemy"] = zombie
	enemies[2]["enemy"] = evil_wizard
	enemies[3]["enemy"] = skeleton
	spawn_timer.wait_time = spawn_delay
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_enemy"))
	wave_end_timer.connect("timeout", Callable(self, "_on_wave_end"))
	display_timer.connect("timeout", Callable(self, "_hide_wave_text"))
	next_wave_btn.connect("pressed", Callable(self, "_on_wave_end"))
	start_wave()

func _process(delta):
	var next_wave_ready = spawned_enemies == enemies_per_wave[wave - 1]
	if next_wave_ready and wave >= wave_amount and path.get_child_count() == 0 and not level_complete:
		# Level complete
		level_complete = true
		get_node("/root/Game/HUD/LevelCompleteUI").visible = true
	elif next_wave_ready and wave_started:
		# Wave complete
		wave_started = false
		if wave < wave_amount:
			get_node("/root/Game/HUD/NextWaveContainer").visible = true
			wave_end_timer.start()

func start_wave():
	wave += 1
	spawned_enemies = 0
	display_wave()
	spawn_timer.start()
	
func display_wave():
	var wave_text = get_node("/root/Game/HUD/Wave")
	wave_text.visible = true
	wave_text.text = "Wave %s" % wave
	display_timer.start()

func _hide_wave_text():
	get_node("/root/Game/HUD/Wave").visible = false
	display_timer.stop()

func _on_spawn_enemy():
	wave_started = true
	if spawned_enemies < enemies_per_wave[wave - 1]:
		var enemy = get_random_enemy(wave).instantiate()
		path.add_child(enemy)
		spawned_enemies += 1
	else:
		spawn_timer.stop()

func _on_wave_end():
	get_node("/root/Game/HUD/NextWaveContainer").visible = false
	if wave < wave_amount:
		wave_end_timer.stop()
		start_wave()
	
func get_random_enemy(wave):
	var available_enemies = []
	for enemy_data in enemies:
		if enemy_data["waveStart"] <= wave:
			available_enemies.append(enemy_data["enemy"])
	return available_enemies[randi() % available_enemies.size()]
