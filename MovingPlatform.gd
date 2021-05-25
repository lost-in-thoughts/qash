extends KinematicBody2D

export var speedX = 1.0
export var speedY = 1.0
export var scaleX = 1.0
export var scaleY = 0.0

var elapsed_time = 0

func _ready():
	pass

func _process(delta):
	self.position.x += cos(elapsed_time * speedX) * scaleX / 1000.0
	self.position.y += sin(elapsed_time * speedY) * scaleY / 1000.0
	elapsed_time += delta
