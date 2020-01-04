extends "res://Actores/PersonajeGenerico/EnemigoPequenio/Enemigo.gd"

export (int) var concavidad

func _process(delta):

	# X va aumenando
	posicion.x += intervalo * delta

	#se multiplica todo por negativo, ya que el eje Y aca esta invertido
	posicion.y =  concavidad * (pow(posicion.x + traslacion.x,2) + traslacion.y)#parabola

	global_position.y = posicion.y
	global_position.x = posicion.x * velocidad

	if (global_position.y <= -270):
		self.queue_free()#eliminamos la navecita
		print("se elimino la nave")