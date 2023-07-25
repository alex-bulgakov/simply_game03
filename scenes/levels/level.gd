extends Node2D
class_name LevelParent

var laser_scene: PackedScene  = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("container"):
		container.connect("open", _on_container_opened)
	for scout in get_tree().get_nodes_in_group("scouts"):
		scout.connect("laser", _on_scout_laser)
		
func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child', item)

func _on_player_laser(pos, direction):
	create_laser(pos, direction)
	
func create_laser(pos, direction):
	$UI.update_laser_text()
	var las = laser_scene.instantiate() as Area2D
	las.position = pos
	las.rotation_degrees = rad_to_deg(direction.angle()) + 90
	las.direction = direction
	$Projectiles.add_child(las)
	


func _on_player_grenade(pos, direction):
	$UI.update_grenade_text()
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)

func _on_scout_laser(pos, direction):
	create_laser(pos, direction)
