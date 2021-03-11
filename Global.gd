extends Node

var GRID : Node

var score = 0
signal changed
var scores = {
	0:0,
	1:0,
	2:0,
	3:10,
	4:20,
	5:50,
	6:100,
	7:200,
	8:300,
	9:1000
}


var shouldShake = false
var shakeDuration = 0.3
var shakeCountdown = 0

func _process(delta):
	if shakeCountdown > 0:
		shouldShake = true
		shakeCountdown -= delta
	else:
		shouldShake = false

func addShake():
	shakeCountdown = shakeDuration


func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func change_score(s):
	score += s
	emit_signal("changed")



# I'm telling Global to pause execution of the grid, which is helpful for when
# I want it to wait for animations/falling to happen
func set_pause_node(node : Node, pause : bool) -> void:
	node.set_process(!pause)
	node.set_process_input(!pause)
	node.set_process_internal(!pause)
	node.set_process_unhandled_input(!pause)
	node.set_process_unhandled_key_input(!pause)

#these two functions allow me to pause individual nodes.
#I need this as opposed to normal timer use or a full-on thread pause because
#the pieces need to keep processing
func pause_for_seconds(node : Node, seconds : float) -> void:
	set_pause_node(node, true) #pause
	yield(get_tree().create_timer(seconds), "timeout") #wait
	set_pause_node(node, false) #resume
	

