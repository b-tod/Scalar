extends Node2D

export (Resource) var bullet_path

func _ready():
	pass

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		shoot(global_position.direction_to(get_viewport().get_mouse_position()))

func shoot(dir):
	var bullet = bullet_path.instance()
	bullet.global_position = global_position
	get_tree().get_root().get_child(0).find_node("World").add_child(bullet)
	bullet.start(dir)

