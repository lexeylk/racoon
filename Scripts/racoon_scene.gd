extends KinematicBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -400.0
var velocity = Vector2()
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
onready var racoon_sprite = get_node("SpRacoon")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = global_var.racoon_drct
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity = move_and_slide(velocity, Vector2.UP)
	if velocity.x < 0:
		racoon_sprite.flip_h = true
	if velocity.x > 0:
		racoon_sprite.flip_h = false
