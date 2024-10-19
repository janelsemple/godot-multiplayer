extends CharacterBody2D

const SPEED = 200.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D

func _ready():
	# You can set up any initial camera properties here
	camera.make_current()  # Ensure this camera is active
	
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	
	if velocity.length() > 0:
		# Player is moving
		animated_sprite.play("walk")
		# Flip the sprite based on horizontal movement
		if velocity.x != 0:
			animated_sprite.flip_h = velocity.x < 0
	else:
		# Player is idle
		animated_sprite.play("idle")
	
	move_and_slide()
