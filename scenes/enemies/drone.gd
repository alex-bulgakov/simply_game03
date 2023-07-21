extends CharacterBody2D

var direction = Vector2.ZERO

var is_enemy = true

func _process(delta):
	# direction
	
	
	if position.x > 1000:
		direction = Vector2.LEFT
	
	if position.x <= 0:
		direction = Vector2.RIGHT
		
	
	# velocity
	velocity = direction * 200
	
	# move
	move_and_slide()

func hit():
	print('damage')
