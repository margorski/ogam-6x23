extends Node

const row = preload("res://Scenes/row.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var start_y = 50
	for i in 6:
		var instance = row.instantiate()
		instance.y = start_y + i * 60
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
