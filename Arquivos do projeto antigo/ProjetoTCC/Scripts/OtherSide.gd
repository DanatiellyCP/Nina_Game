#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
# Script OtherSide.gd

extends Node


func _ready():
	$".".get_node("Portal1/AnimatedSprite").play("poertalAnim")
	

func _physics_process(delta):
	## TRAZENDO O CÓDIGO DO PORTAL 1 - PARA PODER USAR DADOS DO JOGADOR
	var pontos = str (get_node("Jogador/ParallaxDeMenu/lblPontos").text)
	var bodies = $".".get_node("Portal1").get_overlapping_bodies() ##VÁRIAVEL QUE PEGA A COLISÃO DE CORTPOS
	for body in bodies: ## FOR QUE PEGA O CORPO 
		##if body.name == "Jogador": ##  PEGA O CORPO 
			if body.name == "Jogador" and int (pontos) >= 3 :
				print ("Pontos", pontos)
				get_tree().change_scene("res://Cenas/FaseEase.tscn") ## PUXA O NÓ DA PROXIMA CENA
			if body.name == "Jogador" and int (pontos)  >= 7 :
				print ("Pontos", pontos)
				get_tree().change_scene("res://Cenas/fase2Normal.tscn") ## PUXA O NÓ DA PROXIMA CENA
			if body.name == "Jogador" and int (pontos)  >= 10 :
				print ("Pontos", pontos)
				get_tree().change_scene("res://Cenas/fase2Hard.tscn") ## PUXA O NÓ DA PROXIMA CENA
			

func _on_caixaDialogo1_body_entered(body):
	if body.name == "Jogador":
		$texto1.visible == false
