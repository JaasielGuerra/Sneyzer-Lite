extends Node

var escena_estrella = load("res://Escenario/Estrella/Estrella.tscn")
var escena_enemigo = load("res://Actores/Enemigos/EnemigoCinco/EnemigoCinco.tscn")

func _ready():
	randomize()
	$CrearEnemigos.start() #activar el temporizador
	for i in range(0, 18):
		var nueva_estre = escena_estrella.instance()
		nueva_estre.global_position = Vector2(rand_range(0, 480), rand_range(0, 800))
		add_child(nueva_estre)

#creacion de enemigos
func _on_CrearEnemigos_timeout():
	var nuevo_enemigo = escena_enemigo.instance()
	add_child(nuevo_enemigo)

