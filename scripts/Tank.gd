extends KinematicBody2D

var speed = 200 # Quantos pixels por segundo 

#Criando os disparos dinamicamente
var pre_bulllet = preload("res://scenes/Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
			get_parent().add_child(bullet)
		
	translate(Vector2(dir_x, dir_y) * delta * speed)
	# próxima aula a partir do video 15.11 

		
