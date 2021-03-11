extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var moving = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)
export var fall_speed : float =  0.5
export var selected_material : Material

var original_material : Material
var dying = false
var death_sprite : AnimatedSprite

func _ready():
	default_modulate = modulate
	original_material = $Sprite.material
	death_sprite = $AnimatedSprite
	death_sprite.visible = false




func _physics_process(_delta):
	if dying and not $Tween.is_active():
		queue_free()
	if selected:
		$Sprite.set_material(selected_material);

	else:
		if modulate != default_modulate:
			modulate = default_modulate
		$Sprite.set_material(null);
		

func move_piece(change):
	
	target_position = position + change
	var fall_duration = fall_speed
	var oldposition = position
	position = target_position
	
	$Tween.interpolate_property($Sprite, "position", -1*change, Vector2(0,0), fall_duration, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tween.start()
	
	
	
	
	
func die():
	#Global.pause_for_seconds(Global.GRID, 1)
	dying = true;
	death_sprite.visible = true
	$Sprite.visible = false
	death_sprite.play()
	var target_color = $Sprite.modulate
	target_color.a = 0
	var fade_duration = 0.4
	Global.addShake()
	var target_pos = position
	target_pos.y = 1100
	$AudioStreamPlayer2D.play()
	$Tween.interpolate_property($AnimatedSprite, "modulate", $AnimatedSprite.modulate, target_color, fade_duration, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()




