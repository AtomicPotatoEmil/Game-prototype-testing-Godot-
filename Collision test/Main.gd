extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$music.play()

func _process(delta):
	var rand = int(rand_range(1, 100)) - 1
	if(rand == 1):
		self.spawn_enemy()

func spawn_enemy():
	var enemy = preload("res://enemy.tscn")
	if enemy:
		var enemy_instance = enemy.instance()
		add_child(enemy_instance)

