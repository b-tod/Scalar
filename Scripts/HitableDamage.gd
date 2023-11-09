extends Hitable

var max_hp = 20
var hp

signal damage_received

func _ready():
	._ready()
	hp = max_hp

func hit():
	emit_signal("damage_received")
	var dmg = int(rand_range(1, 5))
	hp -= dmg
	
	show_hit_label(dmg)
	
	if main_node.has_node("Sprite"):
		var sprite = main_node.get_node("Sprite")
		var color = (hp / float(max_hp))
		sprite.modulate = Color(color, color, color, 1)
		
	if hp <= 0:
		main_node.queue_free()
