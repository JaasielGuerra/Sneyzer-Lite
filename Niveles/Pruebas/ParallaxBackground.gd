extends ParallaxBackground

export (float) var velocidad


func _process(delta):
	scroll_offset.y += velocidad * delta
	pass
