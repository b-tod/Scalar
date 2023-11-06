extends Hitable

func _ready():
	._ready()

func hit():
	var dmg = int(rand_range(1, 5))
	show_hit_label(dmg)
	
	main_node.queue_free()
