extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stats : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	stats = get_tree().get_root().get_child(0).find_node("Player").find_node("Stats")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"./LabelHPValue".text = str(stats.health)
	$"./LabelScrapValue".text = str(stats.scrap)
