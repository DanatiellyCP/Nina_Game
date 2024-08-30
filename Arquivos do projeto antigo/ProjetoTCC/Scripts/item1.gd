#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
#Script item1.gd

extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#pass

## função que chma a função de dano
func dano():
	$".".queue_free()
