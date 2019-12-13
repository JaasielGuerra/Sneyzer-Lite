extends Area2D

export (float) var velocidad
var posicion = Vector2()

#cuando sale de la pantalla
func _on_Visibilidad_screen_exited():
	self.queue_free()#eliminarse a si misma
	print("Se elimino la bala")
