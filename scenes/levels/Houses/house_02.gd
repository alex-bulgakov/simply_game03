extends Area2D

signal player_entered
signal player_out

func _on_body_entered(_body):
	player_entered.emit()
	

func _ready():
	$LightFanAnimation.play()

func _on_body_exited(_body):
	player_out.emit()
