extends Node2D
class_name LevelParent

var laser_scene: PackedScene  = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_laser(pos, direction):
	$UI.update_laser_text()
	var las = laser_scene.instantiate() as Area2D
	las.position = pos
	las.rotation = direction.angle()
	las.direction = direction
	$Projectiles.add_child(las)
	


func _on_player_grenade(pos, direction):
	$UI.update_grenade_text()
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	
func _on_player_update_stats():
	$UI.update_laser_text()
	$UI.update_grenade_text()
	
