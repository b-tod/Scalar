extends Label

var timer

func _ready():
	timer = Timer.new()
	add_child(timer)
	
	timer.set_wait_time(1.0)
	timer.set_one_shot(true)
	timer.start()
	yield(timer, "timeout")
	queue_free()

func _process(delta):
	rect_position.y -= 100 * delta
	
	var color = modulate
	color.a -= 1.0 * delta
	modulate = color

func display(text):
	self.text = text
	
