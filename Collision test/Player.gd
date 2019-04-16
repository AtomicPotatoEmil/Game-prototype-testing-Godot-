extends Area2D



export (int) var SPEED
var motion = Vector2()
var LIFE = 3
func get_input():
	motion = Vector2()
	if Input.is_key_pressed(KEY_D):
		motion.x += 1
	if Input.is_key_pressed(KEY_A):
		motion.x -= 1
	if Input.is_key_pressed(KEY_S):
		motion.y += 1
	if Input.is_key_pressed(KEY_W):
		motion.y -= 1
	if motion.length() > 0:
		motion = motion.normalized() * SPEED
	
	if motion.x > 0:
		$Sprite.flip_h = false
		if sign($Weapon.position.x) == -1: 
					$Weapon.position.x *= -1
	if motion.x < 0:
		$Sprite.flip_h = true
		if sign($Weapon.position.x) == 1:
					$Weapon.position.x *= -1
	
	
	

func _process(delta):
	get_input()
	
	position += motion * delta
	
	 


func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):
		LIFE -= 1
		print(LIFE)
	if LIFE == 0:
		queue_free()
	if area.is_in_group("life"):
		LIFE += 1
		area.pickup()
		print(LIFE)



