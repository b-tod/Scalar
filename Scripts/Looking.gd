extends Node2D

onready var player = $".."
onready var moving = $"../Moving"

func _process(delta):
	player.look_at(player.position + moving.move_direction)
