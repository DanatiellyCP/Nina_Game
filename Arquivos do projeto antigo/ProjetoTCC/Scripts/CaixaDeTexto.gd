# CaixaDeTexto.gd
extends RichTextLabel

# váriavel array que está armazenando o texto que aparece na caixa de dialogo
var dialog  = ["Olá, meu nome é Nina", 
"Se você vai jogar esse jogo agora",
"Precisara saber sobre a minha história.",
"Estou presa do outro lado, em um mundo sombrio...",
"Não sei como vim parar aqui, mas sei que tudo aqui é perigoso.",
"Eu sou só uma garota de 11 anos, que está na quinta série.",
"A escola nunca foi facil para mim, não sei como é a sua escola, ",
"mas a minha está cheia de valentões. Acho que é isso que você precisa saber",
"A ultima coisa que me lembro, antes de vir parar aqui, é de sentir muito medo.",
"Um dos valentões me trancou no armário do porão da escola.",
"Eu gritei, e chamei por alguém, mas ninguém me ouviu, ninguém pelomenos até agora.",
"Preciso de ajuda para sair desse lugar, será que você poderá fazer isso por mim? ",
"Se sim, precisa saber que essa jornada não será facil",
"Já perdi a conta de quanto tempo estou presa aqui, existem monstros e estranhas criaturas,",
"Que precisam ser enfrentadas, para que eu possa encontrar um caminho de volta para a minha casa."
]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if InputEventMouseButton && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
