extends Node2D

export (Resource) var loot_path

export var drop_loot_on_death : bool
export var drop_loot_on_hit : bool

onready var source = $".."
onready var world = $"../../.."
onready var stats = $"../Stats"

var hitable = null

# Called when the node enters the scene tree for the first time.
func _ready():
	hitable = source.get_node("Hitable")
	if drop_loot_on_hit:
		hitable.connect("on_damage_received", self, "loot_hit")
	if drop_loot_on_death:
		hitable.connect("on_destroyed", self, "loot_dead")

# TODO drop loot based on player/enemy stats
func loot_hit():
	drop_loot(0, 1)
	
func loot_dead():
	drop_loot(1,4)
	

func drop_loot(min_drop, max_drop):
	var drops = min_drop + randi() % (max_drop - min_drop + 1)
	for i in range(0, drops):
		var loot = loot_path.instance()
		# TODO Move this to PickUp constructor/init method
		loot.global_position = source.global_position
		
		var direction : Vector2
		if "destination" in source:
			direction = (source.destination - source.global_position).normalized()
		else:
			direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
			
		loot.direction = direction.rotated(rand_range(-PI/4, PI/4))
		
		if stats.speed:
			loot.velocity = stats.speed * rand_range(1/2, 3/2)
		else:
			loot.velocity = rand_range(0, 30)
		loot.spin = rand_range(-2*PI, 2*PI)

		world.add_child(loot)
