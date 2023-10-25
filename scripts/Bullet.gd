extends Area2D

var dir = Vector2(0, -1)setget set_dir #18.10
var vel = 300 # px/s

func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(dir * delta * vel)

func _on_Notifier_screen_exited():
	print("Sai da tela")
	queue_free()

# Aula do dia 18.10	
func set_dir(val):
	print(val)
	dir = val
	rotation = dir.angle()
