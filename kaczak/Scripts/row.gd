extends Node2D

const blocksAmount = 62
const SolidBlock = preload("res://Scenes/solid_block.tscn")

var horizontal_speed = 0
var pattern = [	1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			   	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			   	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			   	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in blocksAmount:
		if (pattern[i]):
			var block = SolidBlock.instantiate()
			block.set_position(Vector2(-1 + i * 10, 0))
			add_child(block)
	
func _physics_process(delta):
	var x_delta = horizontal_speed * delta

	for N in get_children():
		N.position.x += x_delta
		if (horizontal_speed > 0):
			if (N.position.x > 610): 
				N.position.x = -10
		elif (horizontal_speed < 0):
			if (N.position.x < -10): 
				N.position.x = 610
