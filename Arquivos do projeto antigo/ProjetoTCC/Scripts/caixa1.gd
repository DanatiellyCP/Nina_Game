#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
#Script Caixa1.gd

extends StaticBody2D

# Movimento de caixa
# Copiado do inimigo1


var flip = true 
var posicao_inicial
var posicao_final
var velocidade = 0.5





func _ready():
	#$Sprite.play("andando")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 100

func _physics_process(delta):
	if (posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false 
		if ($".".position.x >= posicao_final):
			flip = false 
	if ($".".position.x>= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = true 
		if ($".".position.x <= posicao_inicial):
			flip = true 
			
		
		
	 
	
	