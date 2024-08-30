#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
#Scritt Loguin.gd

extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass



func _on_JogarButton_pressed():
	var nomeJogador = get_node ("NomeTextEdit").get_text()
	var idadeJogador = get_node ("IdadeTextEdit").get_text()
	print(nomeJogador)
	print(idadeJogador)
	
	## TESTE PARA DECIDIR O GRAU DE DIFICULDADE DO JOGADOR PELA IDADE
	
	if (int(idadeJogador) >=15 and int(idadeJogador)<= 90):
		get_tree().change_scene("res://Cenas/Fase1Hard.tscn") ## se o jogador mais velho que 15 anos fase floresta(fase 1 hard)
		
	if (int(idadeJogador) >= 11 and int(idadeJogador) <= 14 ):
		get_tree().change_scene("res://Cenas/OtherSide.tscn") ## se o jogador mais velho que 11 até 14 anos otherside(fase 1 normal)
	
	if (int(idadeJogador) <= 10 and int(idadeJogador)>=1 ):
		get_tree().change_scene("res://Cenas/Fase1ease.tscn") ## se o jogador mais novo que 10 fase 1 ease(fase 1 ease)
		
	if (int(idadeJogador) <= 0 or idadeJogador == '' ):
		$Mensagem1.visible = true


func _on_VoltarButton_pressed():
	get_tree().change_scene("res://Cenas/StartMenu.tscn")
