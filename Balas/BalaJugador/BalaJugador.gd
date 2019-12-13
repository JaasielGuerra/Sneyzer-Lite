extends "res://Balas/BalaGenerica/BalaGenerica.gd"

func _process(delta):

	posicion.y -= 1 #hacia arriba en Y
	posicion.x = 0#cero en X

	posicion = posicion.normalized() * velocidad * delta

	#sumar la pos a la posicion actual de la bala
	global_position += posicion
