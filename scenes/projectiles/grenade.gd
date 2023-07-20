extends RigidBody2D

const speed = 700

func explode():
	$Explosion.visible = true
	$AnimationPlayer.play("explosion")
