extends CharacterBody2D

func _process(delta):
	look_at(player_pos)
