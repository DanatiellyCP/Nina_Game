#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
# Script Porta1.gd

extends Area2D

##A LINHA ABAIXO CRIA A VARIAVEL QUE SELECIONA A CENA DA PROXIMA FASE
export(String, FILE, "*.tscn") var proximaFase

func _physics_process(delta):
	var bodies = get_overlapping_bodies() ##VÁRIAVEL QUE PEGA A COLISÃO DE CORTPOS
	for body in bodies: ## LOOP QUE PEGA O CORPO 
		if body.name == "Jogador":  ## LOOP QUE PEGA O CORPO JOGADOR
			get_tree().change_scene(proximaFase) ## PUXA O NÓ DA PROXIMA CENA
		
	



