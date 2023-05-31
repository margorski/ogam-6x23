extends Node2D

var speed
var y

const blocksAmount = 31

const SolidBlock = preload("res://Scenes/solid_block.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(0, y))
	var skip = false
	for i in blocksAmount:
		if (skip):
			skip = false
			continue
		if (i % 5 == 0):
			skip = true
			continue
		var block = SolidBlock.instantiate()
		block.set_position(Vector2(i * 10, 0))
		add_child(block)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
