extends Node2D

export (Resource) var collision_script

var creator
var direction
var speed = 1000

var funky = false

func start(creator, dir, funky):
	self.creator = creator
	direction = dir
	self.funky = funky

func _process(delta):
	position += direction * speed * delta
	
	if funky:
		direction = direction.rotated(deg2rad(rand_range(-30, 30)))

func _on_Area2D_area_entered(area):
	get_hitable(area)

func _on_Area2D_body_entered(body):
	get_hitable(body)

func get_hitable(collider):
	var shape = collider.get_child(0)
	if shape.has_method("get_main_node"):
		var main_node = shape.get_main_node()
		if main_node != null and main_node != creator and main_node.has_node("Hitable"):
			main_node.get_node("Hitable").hit()
			queue_free()
