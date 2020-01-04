extends Node

var ene = load("res://Actores/Enemigos/EnemigoSeis/EnemigoSeis.tscn")
var estre = load("res://Escenario/Estrella/Estrella.tscn")


func _ready():

	for i in range(0, 18):
		
		var nueva_estre = estre.instance()
		nueva_estre.global_position = Vector2(rand_range(0, 480), rand_range(0, 800))
		add_child(nueva_estre)

	
func _on_Timer_timeout():
	var nuevo_ene = ene.instance()
	add_child(nuevo_ene)

	