extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_tree().get_nodes_in_group("Player")
	self.add_text(str(player[0].LIFE))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_tree().get_nodes_in_group("Player")
	if player.size() > 0:
		self.clear()
		self.add_text(str(player[0].LIFE))
	if player.size() == 0:
		self.clear()
		self.add_text("0")
