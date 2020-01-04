extends Node2D

var velocidad

func _ready():
	velocidad = rand_range(100, 250)

func _process(delta):
	global_position += Vector2(0, velocidad * delta)
	if(global_position.y > 800):
		global_position = Vector2(rand_range(0, 480), 0)
		velocidad = rand_range(100, 250)
	
