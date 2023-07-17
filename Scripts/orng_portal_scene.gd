extends StaticBody2D

func _ready():
	
	pass

func _on_Area2D_body_entered(body):
	for child in get_parent().get_children():
		if child == body and "racoon" in str(child):
			if global_var.bl_portal_drct == "left":
				global_var.racoon_drct = -1
			elif global_var.bl_portal_drct == "right":
				global_var.racoon_drct = 1
			var new_pos = Vector2(0, 0)
			new_pos += global_var.bl_portal_pos
			if global_var.bl_portal_drct == "up":
				new_pos.y -= 90
			if global_var.bl_portal_drct == "down":
				new_pos.y += 20
			if global_var.racoon_drct == 1:
				new_pos += Vector2(15, 0)
				#body.position = global_var.bl_portal_pos + Vector2(15, 0)
			elif global_var.racoon_drct == -1:
				new_pos += Vector2(-15, 0)
				#body.position = global_var.bl_portal_pos + Vector2(-15, 0)
			body.position = new_pos

	pass
