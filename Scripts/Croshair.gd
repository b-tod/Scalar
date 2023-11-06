extends Node2D

var timer

func _ready():
	timer = Timer.new()
	add_child(timer)

func _process(delta):
	global_position = get_viewport().get_mouse_position()

func shoot(speed):
	$AnimationPlayer.playback_speed = (0.5 / speed)
	$AnimationPlayer.play("Shoot")
	
	timer.set_wait_time(speed)
	timer.set_one_shot(true)
	timer.start()
	yield(timer, "timeout")
	$AnimationPlayer.stop(true)
