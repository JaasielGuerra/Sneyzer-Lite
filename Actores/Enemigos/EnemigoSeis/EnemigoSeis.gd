extends "res://Actores/PersonajeGenerico/EnemigoPequenio/Enemigo.gd"

func _ready():
	#pos inicial de la nave de forma random
	global_position = Vector2(rand_range(100,480-100) , -100)

func _process(delta):

	posicion.x = 0
	posicion.y += 1

	posicion = posicion.normalized() * velocidad * delta

	global_position += posicion

	#verificar si se salio de la pantalla
	if (global_position.y >= 800 + 100):
		queue_free()#eliminar la nave
		print("se elimino la navecita")