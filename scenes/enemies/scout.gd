extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var right_gun_use: bool = true

signal laser(pos, direction)

var health = 30
var can_hit: bool = true

func hit():
	if can_hit:
		health -= 10
		can_hit = false
		$Timers/HitTimeout.start()
		$Sprite2D.material.set_shader_parameter("progress", 1)
	if health <= 0:
		queue_free()
	
	

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)	
		if can_laser:
			var marker_node = $LaserSpawnPositions.get_child(right_gun_use)
			right_gun_use = not right_gun_use
			var pos: Vector2 = marker_node.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserTimer.start()

func _on_attack_area_body_entered(_body):
	player_nearby = true


func _on_attack_area_body_exited(_body):
	player_nearby = false


func _on_hit_timeout_timeout():
	can_hit = true
	$Sprite2D.material.set_shader_parameter("progress", 0)


func _on_laser_timer_timeout():
	can_laser = true
