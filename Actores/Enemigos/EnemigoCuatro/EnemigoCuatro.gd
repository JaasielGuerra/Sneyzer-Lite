extends "res://Actores/PersonajeGenerico/EnemigoPequenio/Enemigo.gd"

func _process(delta):

	posicion.x += intervalo * delta

	posicion.y = -(pow(posicion.x + traslacion.x,2) + traslacion.y)#parabola

	global_position.y = posicion.y
	global_position.x = posicion.x * velocidad

	if(global_position.y <= -50):
		self.queue_free()#eliminar la nave
		print("se elimino la navecita")
