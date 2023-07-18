extends Node2D

var pos: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var pix: float = 1000
#	var sec: float = 60
#	var speed = (pix / sec) * delta
#	$Logo.position.x += speed
#	if $Logo.position.x > pix:
#		$Logo.position.x = 0
	if Input.is_action_pressed("left"):
		position = Vector2.AXIS_X
#
