extends CharacterBody2D

signal laser(position)
signal grenade(position, direction)

var can_laser: bool = true
var can_grenade: bool = true

const speed: int = 300

func _process(_delta):
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# for character body using velocity update and move_and_slide()
	velocity = direction * speed
	move_and_slide()
	
	# rotate
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		laser.emit(selected_laser.global_position, player_direction)
		can_laser = false

	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos = $LaserStartPositions.get_children()[0].global_position	
		grenade.emit(pos, player_direction)
		can_grenade = false

func _on_timer_laser_timeout():
	can_laser = true

func _on_timer_grenade_timeout():
	can_grenade = true



