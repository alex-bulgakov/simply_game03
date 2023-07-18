extends Node2D

func _on_gate_player_entered_gate(body):
	print("recive signal entered gate from gate ")
	print(body)

func _on_player_laser():
	print("laser")


func _on_player_grenade():
	print("grenade")
