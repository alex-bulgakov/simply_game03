extends Node

signal health_change
signal grenade_change
signal laser_change
signal stat_change

var laser_amount = 20:
	set(value):
		laser_amount = value
		stat_change.emit()

var grenade_amount = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()

var player_can_hit: bool = true

var health = 60:
	set(value):
		if value > health:
			health = min(value, 100)
		else:
			if player_can_hit:
				health = value
				player_can_hit = false
				player_can_hit_timer()
		stat_change.emit()
			
func player_can_hit_timer():
	await get_tree().create_timer(0.5).timeout
	player_can_hit = true
	
var player_pos: Vector2
