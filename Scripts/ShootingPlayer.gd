extends "res://Scripts/Shooting.gd"


func _process(delta):
	if can_shoot and Input.is_mouse_button_pressed(BUTTON_LEFT):
		var direction = global_position.direction_to(get_viewport().get_mouse_position())
		direction = direction.rotated(deg2rad(rand_range(-5, 5)))
		shoot(direction, false)
	if can_shoot and Input.is_mouse_button_pressed(BUTTON_RIGHT):
		var direction = global_position.direction_to(get_viewport().get_mouse_position())
		direction = direction.rotated(deg2rad(rand_range(-5, 5)))
		shoot(direction, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
