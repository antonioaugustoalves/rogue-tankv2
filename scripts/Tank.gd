extends KinematicBody2D

var speed = 200 # Quantos pixels por segundo 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		translate(Vector2(1, 0) * delta * speed)
	if Input.is_action_pressed("ui_left"):
		translate(Vector2(-1, 0) * delta * speed)
