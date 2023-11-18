extends Node2D

onready var source = $".."
onready var world = $"../../.."
onready var stats = $"../Stats"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	# Check if body is player (or a valid target)
	var shape = body.get_child(0)
	if shape.has_method("get_main_node"):
		var main_node = shape.get_main_node()
		if main_node != null and main_node is Player:
			source.set_target(main_node)
