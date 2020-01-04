extends "res://Actores/PersonajeGenerico/EnemigoPequenio/Enemigo.gd"

var escena_bala = load ("res://Actores/Balas/BalaEnemigo/BalaEnemigo.tscn")
var puede_disparar = false
var contador = 0
var dir_x = 0
var img = ["ufoBlue","ufoGreen","ufoRed","ufoYellow"]

func _ready():
	global_position = Vector2(480/2,-50)
	dir_x = rand_range(-1, 1)
	$Sprite.texture = load("res://Actores/Enemigos/EnemigoCinco/"+str(img[rand_range(0,3)])+".png")

func _process(delta):
	posicion.y += 1
	posicion.x += dir_x
	posicion = posicion.normalized() * velocidad * delta
	global_position += posicion

	if(global_position.x >= 500 or global_position.y > 820 or global_position.x <= -20):
		self.queue_free()#eliminar la navecita
		print("se elimino la navecita")

	contador += 1
	if  contador == 60 and puede_disparar == false:
		puede_disparar = true
		contador = 0

	if(puede_disparar):
		puede_disparar = false
		var nueva_bala = escena_bala.instance()
		nueva_bala.global_position = $PosDisparo.global_position
		nueva_bala.velocidad = 250
		nueva_bala.tipo_mov = nueva_bala.MOV_DIR_HACIA_JUG
		get_parent().add_child(nueva_bala)
