#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
# Script Histori.gd

extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func _ready():
	$TrilhaHistoria.play() # Toca a musica Wet Dream 
	pass

#func _process(delta):
	##$lblPontuacao.text = 'pontos'



func _on_VoltarHistButton_pressed():
	get_tree().change_scene("res://Cenas/StartMenu.tscn")


func _on_VoltarButton_pressed():
	get_tree().change_scene("res://Cenas/StartMenu.tscn")
