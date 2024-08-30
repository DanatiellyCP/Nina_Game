#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
# StartMenu.gd

extends Control


func _ready():
	$Trilha.play() # Toca a musica Trilha Otherside
	

func _on_StartGameButton_pressed():
	get_tree().change_scene("res://Cenas/Login.tscn")


func _on_QuitGameButton_pressed():
	get_tree().quit()


func _on_Button_pressed():
	pass # replace with function body




func _on_ContinuarButton_pressed():
	pass # replace with function body


func _on_HistoriaButton_pressed():
	get_tree().change_scene("res://Cenas/Historia.tscn")


func _on_AjudaButton_pressed():
	get_tree().change_scene("res://Cenas/Ajuda.tscn")


func _on_ConfigButton_pressed():
	get_tree().change_scene("res://Cenas/Configuracoes.tscn")
