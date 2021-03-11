extends Camera2D


export var shake_amount := 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _process(delta):
	if Global.shouldShake:
		set_offset(Vector2(rand_range(-1.0, 1.0) * shake_amount, rand_range(-1.0, 1.0) * shake_amount))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
