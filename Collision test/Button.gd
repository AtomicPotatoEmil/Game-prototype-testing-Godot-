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


func _on_Button_button_up():
	print("Save button clicked")
	var savefile = File.new()
	savefile.open("user://savegame.save", File.WRITE)
	
	var savenodes = get_tree().get_nodes_in_group("saves")
	for i in savenodes:
		var data = i.call("save")
		print(data)
		savefile.store_line(to_json(data))
	savefile.close()
