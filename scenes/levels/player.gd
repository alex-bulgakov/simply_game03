extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

const speed: int = 300

func _process(_delta):
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# for character body using velocity update and move_and_slide()
	velocity = direction * speed
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		print("shoot laser")
		can_laser = false
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		print("shoot granade")
		can_grenade = false

func _on_timer_laser_timeout():
	can_laser = true

func _on_timer_grenade_timeout():
	can_grenade = true



