extends Node2D

var laser_scene: PackedScene  = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print("recive signal entered gate from gate ")
	print(body)

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
