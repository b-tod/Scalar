class_name Hitable
extends Node2D

export (NodePath) var main_node_path
export onready var main_node = get_node(main_node_path)

onready var hit_label_path = preload("res://Nodes/HitLabel.tscn");
var hit_label

func ready():
	pass

func hit():
	pass

func show_hit_label(damage_amount):
	var hit_label = hit_label_path.instance()
	hit_label.rect_position = main_node.global_position + Vector2(rand_range(-10, 10), -20 + rand_range(-5, 5))
	hit_label.display(str(damage_amount))
	get_tree().get_root().get_child(0).find_node("World").add_child(hit_label)
