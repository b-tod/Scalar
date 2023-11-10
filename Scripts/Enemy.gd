extends Node2D

var speed = 100
var destination

func _ready():
	destination = get_new_move_point()

func get_new_move_point():
	var point = Vector2(rand_range(0, 1280), rand_range(0, 720))
	return point

func _process(delta):
	if position.distance_to(destination) < 1:
		destination = get_new_move_point()
	
	var direction = position.direction_to(destination)
	position += direction * speed * delta
	
	#look_at(destination)
	#rotation_degrees += 90
