extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_size
var screen_size

var initial_camera_bottom_limit

func _restart():
	$Camera2D.set_limit(SIDE_BOTTOM, initial_camera_bottom_limit)
	set_position(Vector2(screen_size.x * 0.5, screen_size.y - player_size.y))
	
func _ready(): 
	player_size = $CollisionShape2D.shape.get_rect().size
	screen_size = get_viewport().size
	initial_camera_bottom_limit = $Camera2D.limit_bottom
	
	_restart()

func _die():
	print("DIED")
	_restart()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_on_floor() and get_last_slide_collision() != null:
		var platform_speed = get_last_slide_collision().get_collider().get_parent().get("horizontal_speed")
		if platform_speed != null:
			velocity.x += platform_speed
	
	move_and_slide()
	
	position.x = clamp(position.x,  player_size.x * 0.5, screen_size.x - player_size.x * 0.5)

	var camera_bottom = $Camera2D.get_screen_center_position().y + screen_size.y * 0.5
	$Camera2D.set_limit(SIDE_BOTTOM, camera_bottom)
	
	if (position.y > camera_bottom):
		_die()
	
	
