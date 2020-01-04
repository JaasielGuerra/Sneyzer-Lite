extends "res://Actores/Balas/BalaGenerica/BalaGenerica.gd"

var posicion = Vector2()
export (float) var velocidad


func _process(delta):

	posicion.y -= 1 #hacia arriba en Y
	posicion.x = 0#cero en X

	posicion = posicion.normalized() * velocidad * delta

	#sumar la pos a la posicion actual de la bala
	global_position += posicion

#eliminar la bala
func _on_BalaJugador_area_entered(area):
	
	#validar que el area que entro no sea el jugador
	if area.get_name() != "Jugador" and !area.is_in_group("BalaEnemigo"):
		queue_free()