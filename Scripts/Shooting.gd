extends Node2D

export (Resource) var bullet_path
onready var source = $".."
onready var stats = $"../Stats"

var timer
var can_shoot = true

func _ready():
	timer = Timer.new()
	add_child(timer)

func _process(delta):
	pass

func shoot(dir, funky):
	var bullet = bullet_path.instance()
	bullet.global_position = global_position
	get_tree().get_root().get_child(0).find_node("World").add_child(bullet)
	bullet.start(source, dir, funky)
	can_shoot = false
	
	get_tree().get_root().get_child(0).find_node("Croshair").shoot(0.15) # 1.0 / player.shoot_speed)
	
	timer.set_wait_time(1.0 / stats.attack_speed)
	timer.set_one_shot(true)
	timer.start()
	yield(timer, "timeout")
	can_shoot = true
