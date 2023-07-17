extends Node2D

@onready var orng_portal = load("res://Scenes/orng_portal_scene.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("left_mouse_button"):
		var new_orng_portal = orng_portal.instance()
		get_parent().add_child(new_orng_portal)
		new_orng_portal.position = Vector2(100, 100)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
