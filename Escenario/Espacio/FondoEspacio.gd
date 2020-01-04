extends ParallaxBackground

export (float) var velocidad = 1
export (int) var fondo = 1

var tipo_fondo = {1 : "black", 2 : "blue", 3 : "darkPurple", 4 : "purple"}

func  _ready():
	if (fondo > 0 and fondo < 5):
		$Capa0/Sprite.texture = load("res://Escenario/Espacio/"+tipo_fondo[fondo]+".jpg")
	else:
		$Capa0/Sprite.texture = load("res://Escenario/Espacio/"+tipo_fondo[1]+".jpg")

func _process(delta):
	scroll_offset.y += velocidad * delta
	

