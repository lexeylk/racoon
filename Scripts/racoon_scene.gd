extends CharacterBody2D

const SPEED = 120.0
const JUMP__velocity = -400.0
var _velocity = Vector2()
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var racoon_sprite = get_node("SpRacoon")

func _physics_process(delta):
	if not is_on_floor():
		_velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		_velocity.y = JUMP__velocity

	var direction = global_var.racoon_drct
	if direction:
		_velocity.x = direction * SPEED
	else:
		_velocity.x = move_toward(_velocity.x, 0, SPEED)

	set_velocity(_velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	if _velocity.x < 0:
		racoon_sprite.flip_h = true
	if _velocity.x > 0:
		racoon_sprite.flip_h = false
