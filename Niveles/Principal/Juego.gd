extends Node

func _on_Jugador_salud_nave(vida):
	$UI/Vida.text = str(vida)