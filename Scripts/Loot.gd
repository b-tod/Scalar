extends Node2D

export (Resource) var loot_path

export var drop_loot_on_death : bool
export var drop_loot_on_hit : bool

onready var source = $".."
onready var world = $"../../.."

var hitable = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if drop_loot_on_hit:
		hitable = source.get_node("Hitable")
		hitable.connect("damage_received", self, "drop_loot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _notification(what):
	if (drop_loot_on_death and what == NOTIFICATION_PREDELETE):
		drop_loot(1, 4)

func drop_loot(min_drop = 0, max_drop = 1):
	var drops = min_drop + randi() % (max_drop - min_drop + 1)
	print(drops)
	for i in range(0, drops):
		var loot = loot_path.instance()
		# TODO Move this to PickUp constructor/init method
		# Set position and direction
		loot.global_position = source.global_position
		
		var direction : Vector2
		if "destination" in source:
			direction = (source.destination - source.global_position).normalized()
		else:
			direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
			
		loot.direction = direction.rotated(rand_range(-PI/4, PI/4))
		# Set velocity and rotation
		# TODO consistent variable names for movement (speed or velocity, not both)
		if "speed" in source:
			loot.velocity = source.speed * rand_range(1/2, 3/2)
		else:
			loot.velocity = rand_range(0, 30)
		loot.spin = rand_range(-2*PI, 2*PI)

		world.add_child(loot)
