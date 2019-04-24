extends Area2D

var LIFE = 3
var speed = 100
var isAlive = true

func _on_enemy_area_entered(area):
	if area.is_in_group("weapon"):
		LIFE -= 1
		print(LIFE)
		if LIFE <= 0:
			self.dead()

func dead():
	self.isAlive = false
	self.set_rotation(1.5708) # ~90 deg
	yield( get_tree().create_timer(2.0), "timeout" )
	queue_free()
