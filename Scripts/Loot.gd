extends Node2D

export (Resource) var loot_path

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		print("TODO: There should be loot...")
