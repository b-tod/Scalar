extends Node

export var health : int
export var damage : int
export var speed : int

export var attack_speed : int
export var attack_range : int

export var scrap : int

var max_health : int

# Reduce current health
func take_damage(dmg):
	health -= dmg
	
# Called when the node enters the scene tree for the first time.
func _ready():
	max_health = health


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
