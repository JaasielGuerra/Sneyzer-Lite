extends Area2D

#constantes
const MOV_DIR_HACIA_JUG = 1
const MOV_PERSEGUIR_JUG = 2

#variables
var diferencia_dist
var tipo_mov
export(float) var velocidad
var dir_bala = Vector2()
var posicion_bala = Vector2()

func _ready():

	match  tipo_mov:

		MOV_DIR_HACIA_JUG:
			#restar los vectores de posicion para apuntar la bala en esa direccion
			dir_bala = global_var.pos_jugador - global_position

		MOV_PERSEGUIR_JUG:
			diferencia_dist =  global_position - global_var.pos_jugador

func _process(delta):

	match tipo_mov:

		MOV_DIR_HACIA_JUG:
			direccion_al_jugador(delta)

		MOV_PERSEGUIR_JUG:
			perseguir_jugador(delta)
			

func _on_BalaEnemigo_area_entered(area):
	if(area.get_name() == "Jugador"):
		queue_free()

func perseguir_jugador(_delta):#esta funcion hace que la bala siga al jugador
	
	#se calcula la diferencia de distancia entre los objetos en cada frame
	diferencia_dist =  global_position - global_var.pos_jugador

	diferencia_dist = diferencia_dist.normalized() * velocidad * _delta
	
	#restar el resultado de diferencia a la pos global de la bala
	global_position =  global_position - diferencia_dist

func direccion_al_jugador(_delta):#mueve la bala en direccion al jugador, de forma lineal

	#direccion de la bala
	posicion_bala.x += dir_bala.x
	posicion_bala.y += dir_bala.y

	posicion_bala = posicion_bala.normalized() * velocidad * _delta

	global_position += posicion_bala
	
