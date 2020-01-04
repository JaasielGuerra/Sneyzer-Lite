extends Node2D

func _ready():
	$AnimatedSprite.frame = 0
	$AnimatedSprite.playing = true

func _on_AnimatedSprite_animation_finished():

	print("se elimino la explosion")
	queue_free()