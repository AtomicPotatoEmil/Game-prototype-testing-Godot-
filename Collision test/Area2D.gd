extends Area2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		set_collision_mask(1)
	else:
		set_collision_mask(0)
