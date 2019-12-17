extends Area2D

var posicion = Vector2()
export (float) var velocidad
var escena_exp = load("res://Efectos/Explosion/Explosion.tscn")

func _process(delta):

	posicion.y -= 1 #hacia arriba en Y
	posicion.x = 0#cero en X

	posicion = posicion.normalized() * velocidad * delta

	#sumar la pos a la posicion actual de la bala
	global_position += posicion

func _on_BalaJugador_area_entered(area):
	#validar si esta en el grupo de enemigos normales
	if area.is_in_group("enemigosNormales"):

		var nueva_exp = escena_exp.instance()
		nueva_exp.global_position = area.global_position
		get_parent().add_child(nueva_exp)

		area.queue_free()# se elimina el enemigo
		self.queue_free()#se elimina a si misma la bala
