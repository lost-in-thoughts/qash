extends KinematicBody2D

const GRAVITIY: Vector2 = Vector2(0.0, 10.0)

var velocity: Vector2

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A):
		pass
	
	velocity += GRAVITIY
	velocity = move_and_slide(velocity, Vector2.UP)
