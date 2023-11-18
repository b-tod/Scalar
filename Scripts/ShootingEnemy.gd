extends "res://Scripts/Shooting.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Enemy_fire_weapons():
	if can_shoot and source.target != null:
		var direction = global_position.direction_to(source.target.position)
		direction = direction.rotated(deg2rad(rand_range(-5, 5)))
		shoot(direction, false)
