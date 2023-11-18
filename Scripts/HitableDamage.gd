extends Hitable

signal on_damage_received
signal on_destroyed

onready var stats = $"../Stats"

export var modulate_sprite = false

func _ready():
	._ready()

func hit(dmg = 2):
	emit_signal("on_damage_received")
	stats.health -= dmg
	
	show_hit_label(dmg)
	
	if modulate_sprite and main_node.has_node("Sprite"):
		var sprite = main_node.get_node("Sprite")
		var color = (stats.health / float(stats.max_health))
		sprite.modulate = Color(color, color, color, 1)
		
	if stats.health <= 0:
		emit_signal("on_destroyed")
		main_node.queue_free()
