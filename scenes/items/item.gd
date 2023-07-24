extends Area2D

var rotation_speed = 5
var available_options = ['laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color("8754d2")
	if type == 'grenade':
		$Sprite2D.modulate = Color("67781f")
	if type == 'health':
		$Sprite2D.modulate = Color("d0130a")
		
	# tween
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1,1), 0.3).from(Vector2(0,0))
	tween.tween_property(self, "position", target_pos, 0.5)
	
	

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == 'health':
		Globals.health += 10
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 1
	queue_free()
