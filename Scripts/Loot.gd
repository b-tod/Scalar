extends Node2D

export (Resource) var loot_path

onready var source = $".."
onready var world = $"../../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		drop_loot()

func drop_loot(min_drop = 1, max_drop = 5):
	for i in range(0, int(rand_range(min_drop, max_drop))):
		# TODO Move this to PickUp constructor/init method
		var loot = loot_path.instance()
		# Set position and direction
		loot.global_position = source.global_position

		var direction = (source.destination - source.global_position).normalized()

		loot.direction = direction.rotated(rand_range(-PI/4, PI/4))
		# Set velocity and rotation
		loot.velocity = source.speed * rand_range(1/2, 3/2)
		loot.spin = rand_range(-2*PI, 2*PI)

		world.add_child(loot)
