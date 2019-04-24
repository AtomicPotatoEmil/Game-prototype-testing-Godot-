extends Area2D

var LIFE = 3
var speed = 100
var isAlive = true

func _on_enemy_area_entered(area):
	var player = get_node("/root/Weapon")
	if area.is_in_group("weapon"):
		LIFE -= player.damage
		print(LIFE)
		if LIFE <= 0:
			self.dead()
		else:
			self.bounce_me_back(area)

func bounce_me_back(weapon):
	var player = weapon.get_owner()
	
	var tween = Tween.new()
	add_child(tween)

	if player.position.x < self.global_position.x:
		tween.interpolate_property(self, "position:x", null, self.position.x + 20.0, 0.02, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	if player.position.x > self.global_position.x:
		tween.interpolate_property(self, "position:x", null, self.position.x - 20.0, 0.02, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()

func dead():
	self.isAlive = false
	print($Sprite)
	var tween = Tween.new()
	add_child(tween)
	$AudioStreamPlayer2D.play()
	tween.interpolate_property($Sprite, "modulate:a", null, 0.0, 2.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property($Sprite, "rotation_degrees", null, 90.0, 0.2, Tween.TRANS_QUAD, Tween.EASE_IN)
	tween.start()
	
	yield( get_tree().create_timer(2.0), "timeout" )
	queue_free()
