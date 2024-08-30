# codigo de movimento de personagem godot
# Projeto TCC Pesquisa
# Por Danatielly da Costa Preira

extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITI = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -500
const ARQUIVO = "user://save.data" ## VARIAVEL QUE SALVA O LUGAR DE SALVAMENTO DO JOGO
var vida = 1 ##Para contar as vidas da personagem

var barraVida = 100
var morte = 3

var posicaoY = $".".position.y
var posicaoX = $".".position.x

var nomeJogadorDisplay





var motion = Vector2()

func _ready():
	##carrega_dados() ## Carregando dados salvos
	$TrilhaSonora.play()
	


func _physics_process(delta):
	motion.y += GRAVITI
	var friction = false 
	
	## Morte por cair em abismos
	if motion.y == 1440:
		morte = morte - 1
		vida -= 1
		barraVida -= 30
		var pontuacao = get_node("ParallaxDeMenu/lblPontos").set_text(str(vida))
		var bv = get_node("ParallaxDeMenu/barraViada").set_value(barraVida)
		$".".position.x = 58.456402
		$".".position.y = 91.8601
		if (morte == 0) or (vida == 0):
			get_tree().change_scene("res://Cenas/StartMenu.tscn")
			print (morte)
		
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("andando") 
		
		if $Passos.playing == false :
			$Passos.play() ## chama a função de audio de passos
		
		print (posicaoY)
		print (posicaoX)
		#####################################
		## CÓDIGO PARA EMPURRAR A CAIXA
		## usa o RayCast2D empurraD
		get_node("empurraD").set_enabled(motion.x)
		if get_node("empurraD").is_colliding():
			var body = get_node("empurraD").get_collider()
			body.move_and_collide(Vector2(30,0) * delta)
			## O MOVE NÃO FUNCIONOU SUBSTITUI PELO move_and_collide 
			
		######################################################
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("andando") 
		if $Passos.playing == false :
			$Passos.play() ## chama a função de audio de passos
		print (posicaoY)
		print (posicaoX)
		#####################################
		## CÓDIGO PARA EMPURRAR A CAIXA lado ao contrario
		## usa o RayCast2D empurraE
		get_node("empurraE").set_enabled(motion.x)
		if get_node("empurraE").is_colliding():
			var body = get_node("empurraE").get_collider()
			body.move_and_collide(Vector2(-30,0) * delta)
			## O MOVE NÃO FUNCIONOU SUBSTITUI PELO move_and_collide 
		############################# 
		
	else:
		motion.x = 0
		$AnimatedSprite.stop()
		$Passos.stop()   ## chama a função de audio de passos
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$Pulo.play() ## chama som de pulo
		if friction == true:
			motion.x =  lerp(motion.x, 0, 0.2)
	## COLOCAR AQUI O ELSE PARA EVENTOS DE ANIMAÇÃO DE PULO 		
	## https://www.youtube.com/watch?v=ZsP7JDrRTJY&list=PL9FzW-m48fn2jlBu_0DRh7PvAt-GULEmd&index=3 
	## EM 9:52 DO VIDEO
	
	
			
	motion = move_and_slide(motion, UP)
	
	## PARA CORRIGIR O TILEMAPS SEGUIR VENDO OS VIDEOS
	## https://www.youtube.com/watch?v=uV5WKocIycY&list=PL9FzW-m48fn2jlBu_0DRh7PvAt-GULEmd&index=5
	## PARTE 5
	
	pass
	

	
	
## Função de botão que chama a tela de inicio
func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/StartMenu.tscn") 

## Função de contato dos pés do player
func _on_pes_body_entered(body):
	vida += 5 
	barraVida += 30
	##save()
	var bv = get_node("ParallaxDeMenu/barraViada").set_value(barraVida)
	var pontuacao = get_node("ParallaxDeMenu/lblPontos").set_text(str(vida))
	body.dano()
	
	
	
## CONTINUAR AS VIDEO AULA DE DANOS NO MONSTRO E NO PLAYER 
## https://www.youtube.com/watch?v=hogCt70zDpY&index=8&list=PLk9XvfPR8vS_EOidYR4kwGtC1otkplISO
##GODOT 3.0 - AULA 08 - ANIME MORTE + PULO!

##Função de dano no player nina morre chama atela de menu e reinicia o jogo
##SÓ É VALIDO PARA LAYERS E MASKS NA TERCEIRA CAMADA
##PRECISA CRIAR AREA DE COLISÃO PARA OUTRAS CAMADA PARA MODIFICAR A FUNÇÃO DE PONTUAÇÃO
func _on_dano_body_entered(body):
	if body.name=="item1":
		vida += 5 
		var pontuacao = get_node("ParallaxDeMenu/lblPontos").set_text(str(vida))
	if body.name=="inimigo1":
		barraVida -= 30
		vida -= 2 
		var pontuacao = get_node("ParallaxDeMenu/lblPontos").set_text(str(vida))
		var bv = get_node("ParallaxDeMenu/barraViada").set_value(barraVida)## arrumar aqui
		if vida <= 0:
			get_tree().change_scene("res://Cenas/StartMenu.tscn")
			
			## ao invés de voltar para o meu, volta para o começo da fase
			##$".".position(21.483299, -6.45219)
			


	print(vida)
	print(barraVida)
	
	

## Botão que chma o menu
func _on_botaoMenu_pressed():
	get_tree().change_scene("res://Cenas/StartMenu.tscn")
	
#################################################################################
## Função para salvar o jogo
func save():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	var dados = {"barraVida" : barraVida,
	"vida" : vida,
	"morte" : morte
		
		}
	if not erro:
		arquivo.store_var(dados)
	else:
		print ('Erro ao salvar dados')
	
	arquivo.close()
	pass

## Função para carregar o salvamento
func carrega_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	if not erro:
		var dadosSalvos = arquivo.get_var()
		barraVida = dadosSalvos["barraVida"]
		vida = dadosSalvos["vida"]
		morte = dadosSalvos["morte"]
		var pontuacao = get_node("ParallaxDeMenu/lblPontos").set_text(str(vida))
		var bv = get_node("ParallaxDeMenu/barraViada").set_value(barraVida)
	else:
		print ('Erro ao carregar jogo')
	
	arquivo.close()
	
	## Atualizar os textos
	
######################################################################################