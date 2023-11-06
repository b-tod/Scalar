extends Node2D

export (Resource) var enemy_path

func _ready():
	for i in range(0, int(rand_range(20, 50))):
		spawn_enemy()

func spawn_enemy():
	var enemy = enemy_path.instance()
	enemy.global_position = Vector2(rand_range(0, 1280), rand_range(0, 720))
	add_child(enemy)
