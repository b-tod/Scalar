extends Area2D

var direction
var speed = 1000

func start(dir):
	direction = dir

func _process(delta):
	position += direction * speed * delta
