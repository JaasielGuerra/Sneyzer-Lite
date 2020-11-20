extends Area2D

var escena_bala = load("res://Actores/Balas/BalaJugador/BalaJugador.tscn")
var escena_exp = load("res://Efectos/Explosion/Explosion.tscn")
var T_PANTALLA
var posicion = Vector2()
var vida = 3

export (float) var velocidad
signal _salud_nave(vida)

func _ready():
	T_PANTALLA = get_viewport().size#tamnio de pantalla
	set_process(false) #desactivar al inciio el procesamiento
	aparecer()
	randomize()
	$Protec.hide()
	emit_signal("_salud_nave", vida)

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
	
	#vector de posicion, se normaliza y se multiplica velocidad y tiempo
	posicion = posicion.normalized() * velocidad * delta
	
	#mover sumandole a su posicion actual el vector de posicion
	global_position += posicion

	#bloquear el desplazamiento al tamanio de pantalla
	global_position.x = clamp(global_position.x, 0, T_PANTALLA.x)
	global_position.y = clamp(global_position.y, 0, T_PANTALLA.y)
	
	#salvar la posicion del jugador en el scrip global
	global_var.pos_jugador = global_position

#funcion para instanciar disparos
func disparo():
	var nueva_bala = escena_bala.instance()
	nueva_bala.global_position =  $PosDisparo.global_position
	nueva_bala.velocidad = 950
	get_parent().add_child(nueva_bala)

#senial de Area2D cuanto algo colisiona con la nave
func _on_Jugador_area_entered(area):
	if area.is_in_group("BalaEnemigo") or area.is_in_group("Enemigo"):
		vida -= 1 #restar vida
		emit_signal("_salud_nave", vida)
		set_process(false) #desactivar el procesamiento
		$FormaCol.disabled = true #descativar deteccion de colision
		$Protec.show()#mostrar el sprite de proteccion
		$Protec/Anim.play("anim")
		$Inmunidad.start()#iniciar timer
		aparecer()
		for i in range(0,3):
			var nueva_exp  = escena_exp.instance()
			nueva_exp.global_position = Vector2(
				global_position.x + rand_range(-35,35), 
				global_position.y + rand_range(-35,35))
			get_parent().add_child(nueva_exp)

		#si la vida llega a cero
		if vida == 0:
			queue_free()#eliminar la nave

#hace aparecer a la nave
func aparecer():
	#animando con el nodo Tween
	$Aparecer.interpolate_property(self, "global_position", Vector2(T_PANTALLA.x/2, T_PANTALLA.y + 150), Vector2(T_PANTALLA.x/2, T_PANTALLA.y - 150) , 1, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	$Aparecer.start()

#senial del nodo Tween cuando se finaliza la animacion
func _on_Aparecer_tween_completed(object, key):
	set_process(true) #activar el procesamiento

#cuando termina el tiempo de inmunidad
func _on_Inmunidad_timeout():
	$FormaCol.disabled = false #volver a activar la deteccion de colision
	$Protec.hide()#ocultar el sprite de proteccion
	$Protec/Anim.stop()
