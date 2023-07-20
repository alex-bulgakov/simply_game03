extends Node2D

var laser_scene: PackedScene  = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var tree = get


func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0 , 0.5)

func _on_player_laser(pos, direction):
	var las = laser_scene.instantiate() as Area2D
	las.position = pos
	las.rotation = direction.angle()
	las.direction = direction
	$Projectiles.add_child(las)


func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)

func _on_house_02_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
#	tween.tween_property($Player, "modulate:a", 0, 1)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_SINE)
	


func _on_house_02_player_out():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1)
	
