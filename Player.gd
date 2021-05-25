extends KinematicBody2D

const GRAVITIY: Vector2 = Vector2(0.0, 30.0)
const JUMP: float = -800.0
const SPEED: float = 40.0
var velocity: Vector2
var slow: bool = false
var wall_jump: bool = false

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_left"):
		velocity += Vector2(-SPEED, 0.0)
	if Input.is_action_pressed("ui_right"):
		velocity += Vector2(SPEED, 0.0)
	
	# reduce sliding
	velocity.x *= 0.9
	
	if is_on_floor():
		wall_jump = false
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP
	else:
		if is_on_wall():
			if Input.is_action_just_pressed("jump") and not wall_jump:
				velocity.y = JUMP
				wall_jump = true
	#else:
	#	slow = not is_on_floor() and Input.is_key_pressed(KEY_SPACE)
	if is_on_wall() and velocity.y > 0:
		velocity = GRAVITIY / 20.0
	else:
		velocity += GRAVITIY
		
	velocity = move_and_slide(velocity, Vector2.UP)


func _process(delta: float) -> void:
	if slow:
		print("slow")
