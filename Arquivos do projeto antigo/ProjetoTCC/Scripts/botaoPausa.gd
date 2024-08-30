#Por Danatielly da Costa Pereira
#Projeto de pesquisa para TCC 2018 IFSP - Salto - SP/BR
#Script botaoPausa.gd

extends Button


func _on_botaoPausa_pressed():
	if get_tree().paused:
		get_tree().paused = false
		text = "Pausar"
	else:
		get_tree().paused = true
		text = "Despausar"
		
