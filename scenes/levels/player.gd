extends CharacterBody2D

const speed: int = 300

func _process(_delta):
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# for character body using velocity update and move_and_slide()
	velocity = direction * speed
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
		
	if Input.is_action_pressed("secondary action"):
		print("shoot granade")
