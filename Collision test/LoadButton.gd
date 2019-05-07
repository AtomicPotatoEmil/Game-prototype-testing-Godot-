extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_LoadButton_button_up():
	print("Load button clicked")
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		print("No savegame file found")
		return
	var save_nodes = get_tree().get_nodes_in_group("saves")
	for i in save_nodes:
		i.queue_free()
	save_game.open("user://savegame.save", File.READ)
	print(save_game)
	while not save_game.eof_reached():
		var current_line = parse_json(save_game.get_line())
		if current_line:
			var new_object = load(current_line["filename"]).instance()
			get_node(current_line["parent"]).add_child(new_object)
			new_object.call("load", current_line)
	save_game.close()

