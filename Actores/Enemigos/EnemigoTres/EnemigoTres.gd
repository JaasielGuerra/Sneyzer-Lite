extends "res://Actores/PersonajeGenerico/PersonajeGenerico.gd"

func _process(delta):
	
	posicion.x += intervalo * delta

	posicion.y = -(((pow(posicion.x + traslacion.x, 3)) / amplitud_curva) + traslacion.y)

	global_position.x = posicion.x * velocidad
	global_position.y = posicion.y

	if (global_position.y <= -50):
		self.queue_free()#borrar la nave de memoria
		print("se elimino la navecita")