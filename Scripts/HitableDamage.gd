extends Hitable

var max_hp = 10
var hp

func _ready():
	hp = max_hp

func hit():
	hp -= 1
	print(hp)
	if main_node.has_node("Sprite"):
		var sprite = main_node.get_node("Sprite")
		var color = (hp / float(max_hp))
		sprite.modulate = Color(color, color, color, 1)
		print(sprite.modulate)
	if hp == 0:
		main_node.queue_free()
