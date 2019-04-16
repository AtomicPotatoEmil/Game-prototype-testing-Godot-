extends Area2D


var LIFE = 3

var speed = 100


func _on_enemy_area_entered(area):
	if area.is_in_group("weapon"):
		LIFE -= 1
		print(LIFE)

func dead():
	if LIFE == 0:
		queue_free()

