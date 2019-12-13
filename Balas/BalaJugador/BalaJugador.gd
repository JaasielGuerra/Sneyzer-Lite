extends "res://Balas/BalaGenerica/BalaGenerica.gd"

func _process(delta):

	posicion.y -= 1 #hacia arriba en Y
	posicion.x = 0#cero en X

	posicion = posicion.normalized() * velocidad * delta

	#sumar la pos a la posicion actual de la bala
	global_position += posicion

func _on_BalaJugador_area_entered(area):
	#validar si esta en el grupo de enemigos normales
	if area.is_in_group("enemigosNormales"):
		area.queue_free()# se elimina el enemigo
		self.queue_free()#se elimina a si misma la bala
