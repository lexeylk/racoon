extends StaticBody2D

@onready var orng_portal = load("res://Scenes/orng_portal_scene.tscn")
@onready var bl_portal = load("res://Scenes/bl_portal_scene.tscn")
func _ready():
	input_pickable = true

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_mouse_pressed"):
		for child in get_parent().get_children():
			if str(child)[0] == "o":
				get_parent().remove_child(child)
		var new_orng_portal = orng_portal.instantiate()
		get_parent().add_child(new_orng_portal)
		new_orng_portal.position = position
		global_var.or_portal_pos = position
		global_var.or_portal_drct = "right"
	
	if event.is_action_pressed("right_mouse_pressed"):
		for child in get_parent().get_children():
			if str(child)[0] == "b":
				get_parent().remove_child(child)
		var new_bl_portal = bl_portal.instantiate()
		get_parent().add_child(new_bl_portal)
		new_bl_portal.position = position
		global_var.bl_portal_pos = position
		global_var.bl_portal_drct = "right"
