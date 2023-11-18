extends Node2D

var destination

onready var stats = $Stats

var target : Node2D
var patrol_path : Node 

signal fire_weapons

enum State {
	IDLE, 		# Stand idle in place
	PATROL, 	# Patrol - move along patrol path back and forth or in circles
	SEEK, 		# Move semi-randomly in search of the player
	FOLLOW, 	# Move toward the target
	ATTACK,		# Attack the target
	RETREAT,	# Move away from the target
}

onready var state_to_func : Dictionary = {
	State.IDLE 	  : funcref(self, "idle"),
	State.PATROL  : funcref(self, "patrol"),
	State.SEEK 	  : funcref(self, "seek"),
	State.FOLLOW  : funcref(self, "follow"),
	State.ATTACK  : funcref(self, "attack"),
	State.RETREAT : funcref(self, "retreat"),
}

var state = State.SEEK

func _ready():
	destination = get_new_move_point()

func get_new_move_point():
	var point = Vector2(rand_range(0, 1280), rand_range(0, 720))
	return point

func _process(delta):
	state_to_func[state].call_func(delta)

func idle(delta):
	pass
	
func patrol(delta):
	pass

func seek(delta):
	if position.distance_to(destination) < 1:
		destination = get_new_move_point()
	move(delta)

func follow(delta):
	if target_in_range():
		state = State.ATTACK
	else:
		move_to_target(delta)
	
func attack(delta):
	if target_in_range():
		emit_signal("fire_weapons")
	else:
		state = State.FOLLOW
	
func retreat(delta):
	pass

func move(delta):
	var direction = position.direction_to(destination)
	position += direction * stats.speed * delta
	
	look_at(destination)
	rotation_degrees += 90

func move_to_target(delta):
	destination = target.position
	move(delta)

func set_target(new_target):
	target = new_target
	state = State.ATTACK

func target_in_range():
	return target.position.distance_to(position) < stats.attack_range
