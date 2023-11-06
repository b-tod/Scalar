extends Node2D

export (Resource) var bullet_path
onready var player = $".."

var timer
var can_shoot = true

func _ready():
	timer = Timer.new()
	add_child(timer)

func _process(delta):
	if can_shoot and Input.is_mouse_button_pressed(BUTTON_LEFT):
		shoot(global_position.direction_to(get_viewport().get_mouse_position()))

func shoot(dir):
	var bullet = bullet_path.instance()
	bullet.global_position = global_position
	get_tree().get_root().get_child(0).find_node("World").add_child(bullet)
	bullet.start(player, dir)
	can_shoot = false
	
	timer.set_wait_time(1.0 / player.shoot_speed)
	timer.set_one_shot(true)
	timer.start()
	yield(timer, "timeout")
	can_shoot = true
