extends "res://Balas/BalaGenerica/BalaGenerica.gd"

func _ready():
	dir.y = -1
	dir.x = 0

func _process(delta):
	
	desplazamiento.x = dir.x#movimiento en X cero
	desplazamiento.y = dir.y * (velocidad * delta)#movimiento en Y
	
	move_and_collide(desplazamiento)
	

	pass
