extends Area2D

var SPEED = 150
var motion = Vector2()
var LIFE = 3
var RUSH = false
var initial_weapon_x = null

func _ready():
	self.initial_weapon_x = $Weapon.position.x

func save():
	return {
		"filename": get_filename(),
		"parent": get_parent().get_path(),
		"name": "player",
		"health": self.LIFE
	}

func load(data):
	self.LIFE = data.health

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
			$Weapon.position.x = self.initial_weapon_x
	if motion.x < 0:
		$Sprite.flip_h = true
		if sign($Weapon.position.x) == 1:
			$Weapon.position.x = 0 - ($CollisionShape2D.shape.get_extents().x * 1.7)

func _process(delta):
	get_input()
	Rush_move()
	position += motion * delta

func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):
		if area.isAlive:
			LIFE -= 1
			print(LIFE)
	if LIFE == 0:
		queue_free()
	if area.is_in_group("life"):
		LIFE += 1
		area.pickup()
		print(LIFE)
	if area.is_in_group("Rush Powerup"):
		RUSH = true
	var weaponpower = get_node("/root/Weapon")
	if area.is_in_group("WeaponPow"):
		weaponpower.damage += 2

func Rush_move():
	if RUSH == true:
		if Input.is_action_pressed("rush"):
			SPEED = 450
		else:
			SPEED = 150

