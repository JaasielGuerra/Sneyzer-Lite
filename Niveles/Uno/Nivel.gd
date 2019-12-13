extends Node

var ene = load("res://Actores/Enemigos/EnemigoUno/EnemigoUno.tscn")
var eneDos = load("res://Actores/Enemigos/EnemigoTres/EnemigoTres.tscn")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Timer_timeout():

	var nuevo_ene = ene.instance()
	get_parent().add_child(nuevo_ene)

	pass

func _on_Timer2_timeout():
	var nuevo_ene = eneDos.instance()
	get_parent().add_child(nuevo_ene)
	pass