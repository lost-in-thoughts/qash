extends KinematicBody2D

const GRAVITIY: Vector2 = Vector2(0.0, 30.0)
const JUMP: Vector2 = Vector2(0.0, -800.0)
const SPEED: float = 40.0
var velocity: Vector2

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A):
		velocity += Vector2(-SPEED, 0.0)
	if Input.is_key_pressed(KEY_D):
		velocity += Vector2(SPEED, 0.0)
	
	# reduce sliding
	velocity.x *= 0.9
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity += JUMP
		
	velocity += GRAVITIY
	velocity = move_and_slide(velocity, Vector2.UP)
