extends LevelParent




func _on_area_2d_body_entered(body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)
