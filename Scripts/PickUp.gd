extends Node2D
class_name PickUp

export var value = 10

var velocity = 0
var spin = 0
export var direction : Vector2

var timer

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += direction * velocity * delta
	rotate(spin * delta)
