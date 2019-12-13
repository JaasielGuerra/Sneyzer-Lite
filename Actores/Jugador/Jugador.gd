extends "res://Actores/PersonajeGenerico/PersonajeGenerico.gd"

var escena_bala = load("res://Balas/BalaJugador/BalaJugador.tscn")
var t_pantalla

func _ready():
	t_pantalla = get_viewport().size#tamnio de pantalla
	pass

func _process(delta):
	
	posicion = Vector2() #reiniciar el vector
	
	#comprobando entradas
	if Input.is_action_pressed("ui_right"):
		posicion.x += 1
	if Input.is_action_pressed("ui_left"):
		posicion.x -= 1
	if Input.is_action_pressed("ui_up"):
		posicion.y -= 1
	if Input.is_action_pressed("ui_down"):
		posicion.y += 1
	
	if Input.is_action_just_pressed("ui_accept"):
		disparo()
		pass
	
	#vector de posicion, se normaliza y se multiplica velocidad y tiempo
	posicion = posicion.normalized() * velocidad * delta
		
	#mover sumandole a su posicion actual el vector de posicion
	global_position += posicion

	#bloquear el desplazamiento al tamanio de pantalla
	global_position.x = clamp(global_position.x, 0, t_pantalla.x)
	global_position.y = clamp(global_position.y, 0, t_pantalla.y)
	
#funcion para instanciar disparos
func disparo():
	var nueva_bala = escena_bala.instance()
	nueva_bala.global_position = $PosDisparo.global_position
	get_parent().add_child(nueva_bala)
	pass