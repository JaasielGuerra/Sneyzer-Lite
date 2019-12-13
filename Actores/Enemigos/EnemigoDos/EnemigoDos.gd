extends "res://Actores/PersonajeGenerico/PersonajeGenerico.gd"

func _ready():
	
	pass
func _process(delta):


	posicion.y += intervalo * delta

	posicion.x = (sin(posicion.y) * amplitud_curva) + traslacion.x#funcion del seno

	global_position.x = posicion.x 
	global_position.y = posicion.y * velocidad

	if(global_position.y >= 850):
		self.queue_free()#eliminar la navecita
		print("se elimino la navecita")

	
