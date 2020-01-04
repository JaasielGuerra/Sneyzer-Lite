extends Area2D

#var dir = Vector2() #para la direccion de la nave
export (float) var velocidad #para la velocidad de la nace
var posicion = Vector2()# vector para manejar la posicion del objeto
export (Vector2) var traslacion = Vector2()# vector para la traslacion de la funion
export (float) var intervalo# para los intervalor  de la funion
export (float) var amplitud_curva# para la amplitud de la curva
var escena_exp = load("res://Efectos/Explosion/Explosion.tscn")

#comprobar si la colision es de la bala del jugador para destruirlo
func _on_Enemigo_area_entered(area):

    if area.is_in_group("BalaJugador"):

        var nueva_exp = escena_exp.instance()
        nueva_exp.global_position = global_position
        get_parent().add_child(nueva_exp)
        queue_free()
