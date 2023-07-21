extends LevelParent

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)

func _on_house_02_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
#	tween.tween_property($Player, "modulate:a", 0, 1)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1).set_trans(Tween.TRANS_SINE)



func _on_house_02_player_out():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.3, 0.3), 1)
