extends Node2D

onready var player = $".."
onready var stats = $"../Stats"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	var shape = area.get_child(0)
	if shape.has_method("get_main_node"):
		var main_node = shape.get_main_node()
		if main_node != null and main_node is PickUp:
			collect(main_node)
			main_node.queue_free()


func collect(pickup):
	stats.scrap += pickup.value
