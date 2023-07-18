extends Node2D

const speed: int = 100

func _process(delta):
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	position += speed * direction * delta
	
	# laser shooting input
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
		
	if Input.is_action_pressed("secondary action"):
		print("shoot granade")
	
	
		
