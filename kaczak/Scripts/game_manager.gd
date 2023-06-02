extends Node

const row = preload("res://Scenes/row.tscn")

var currentLevel = 0
var rng = RandomNumberGenerator.new()

const spaceBetweenLevels = 70
const maxLevels = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_size = get_viewport().size
	
	for i in maxLevels:
		var instance = row.instantiate()
		instance.position.y = screen_size.y - (i + 1) * spaceBetweenLevels
		instance.horizontal_speed = (-1 if i % 2 else 1) * rng.randi_range(25, 125)
		print(i)
		print(instance.horizontal_speed)
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
