extends KinematicBody2D

export var speed = 500

var move_direction : Vector2

func _ready():
	pass

func _process(delta):
	
	move_direction = Vector2()
	if Input.is_action_pressed("ui_up"):
		move_direction += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		move_direction += Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		move_direction += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		move_direction += Vector2(1, 0)
	
	move_direction = move_direction.normalized()
	position += move_direction * speed * delta
	
	#$Sprite.rotation_degrees = 0
	look_at(position + move_direction)
	#$Sprite.rotation_degrees += 90

func _input(event):
	pass
