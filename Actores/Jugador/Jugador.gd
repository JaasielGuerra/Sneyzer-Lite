extends "res://Actores/PersonajeGenerico/PersonajeGenerico.gd"

var escena_bala = load("res://Balas/BalaJugador/BalaJugador.tscn")
var t_pantalla

func _ready():
	t_pantalla = get_viewport().size#tamnio de pantalla
	pass

func _process(delta):
	
	dir = Vector2() #reiniciar el vector
	
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	if Input.is_action_pressed("ui_up"):
		dir.y = -1
	if Input.is_action_pressed("ui_down"):
		dir.y = 1
	
	if Input.is_action_just_pressed("ui_accept"):
		var nueva_bala = escena_bala.instance()
		nueva_bala.global_position = $Pos.global_position
		get_parent().add_child(nueva_bala)
		pass
	
	#vector de desplazamiento
	desplazamiento.x = dir.x * (velocidad * delta)
	desplazamiento.y = dir.y * (velocidad * delta)
	desplazamiento.normalized()#normalizar el vector
	
	#bloquear el desplazamiento al tamanio de pantalla
	global_position.x = clamp(global_position.x, 0, t_pantalla.x)
	global_position.y = clamp(global_position.y, 0, t_pantalla.y)
	
	#desplazar
	move_and_collide(desplazamiento)

	pass
