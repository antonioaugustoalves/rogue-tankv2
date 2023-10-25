tool
extends KinematicBody2D

var speed = 200 # Quantos pixels por segundo 

#Criando os disparos dinamicamente
var pre_bulllet = preload("res://scenes/Bullet.tscn")

#lista de skins do tank 18/10 = 
var bodies = [
	"res://sprites/tankBody_bigRed.png",
	"res://sprites/tankBody_blue.png",
	"res://sprites/tankBody_dark.png",
	"res://sprites/tankBody_darkLarge.png",
	"res://sprites/tankBody_green.png",
	"res://sprites/tankBody_huge.png",
	"res://sprites/tankBody_red.png",
	"res://sprites/tankBody_sand.png"
]
var barrels = [
	"res://sprites/tankBlue_barrel1.png",
	"res://sprites/tankBlue_barrel2.png",
	"res://sprites/tankBlue_barrel3.png",
	"res://sprites/tankDark_barrel1.png",
	"res://sprites/tankDark_barrel2.png",
	"res://sprites/tankDark_barrel3.png",
	"res://sprites/tankGreen_barrel1.png",
	"res://sprites/tankGreen_barrel2.png",
	"res://sprites/tankGreen_barrel3.png",
	"res://sprites/tankRed_barrel1.png",
	"res://sprites/tankRed_barrel2.png",
	"res://sprites/tankRed_barrel3.png",
	"res://sprites/tankSand_barrel1.png",
	"res://sprites/tankSand_barrel2.png",
	"res://sprites/tankSand_barrel3.png"
]
export(int, 
"Big Red", "blue","dark",
"darkLarge","green","huge",
"red","sand") var tankBody = 6 setget set_body

export(int,
"Blue 1", "Blue 2", "Blue 3",
"Dark 1", "Dark 2", "Dark 3",
"Green 1", "Green 2", "Green 3",
"Red 1", "Red 2", "REd 3",
"Sand 1", "Sand 2", "Sand 3") var barrelType = 2 setget set_barrel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _draw():
	$sprite.texture = load(bodies[tankBody])
	$Barrel/sprite.texture = load(barrels[barrelType])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.editor_hint:
		return
		
	var dir_x = 0
	var dir_y = 0
	if Input.is_action_pressed("ui_right"):
		dir_x +=1
	if Input.is_action_pressed("ui_left"):
		dir_x -=1
	if Input.is_action_pressed("ui_up"):
		dir_y -= 1
	if Input.is_action_pressed("ui_down"):
		dir_y += 1
	if Input.is_action_just_pressed("ui_shot"):
		print("Bang!")
		# Contando quantos tiros tem em um grupo
		var counter = get_tree().get_nodes_in_group("cannon_bullets").size()
		if counter < 6:
			var bullet = pre_bulllet.instance()
			bullet.global_position = $Barrel/Muzzle.global_position
			#Aula do dia 18.10
			bullet.dir = Vector2(cos(rotation), sin(rotation)).normalized()
			get_parent().add_child(bullet)
			# 18.10
			$Barrel/Animation.play("fire")
	translate(Vector2(dir_x, dir_y) * delta * speed)
	# próxima aula a partir do video 15.11 
	look_at(get_global_mouse_position())
	
func set_body(val):
	tankBody = val
	if Engine.editor_hint:
		update()
		
func set_barrel(val):
	barrelType = val
	if Engine.editor_hint:
		update()
		

		
