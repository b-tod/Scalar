extends CollisionShape2D

export (NodePath) var main_node_path

func get_main_node():
	return get_node(main_node_path)
