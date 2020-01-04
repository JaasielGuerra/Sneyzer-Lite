extends Area2D

#cuando sale de la pantalla
func _on_Visibilidad_screen_exited():
	self.queue_free()#eliminarse a si misma
	print("Se elimino la bala")
