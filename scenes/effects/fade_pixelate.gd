extends CanvasLayer

class_name FadePixelate

@export var seconds: float
@export var initial: float
@export var animateAtStart: bool

var overlay: ColorRect

func _ready():
	overlay = get_node('Pixelate')
	Signals.on_scene_change.connect(fade_in)
	if !animateAtStart:
		overlay.hide()
		return
	overlay.show()
	overlay.material = overlay.material.duplicate()
	overlay.material.set("shader_parameter/size_x", initial)
	overlay.material.set("shader_parameter/size_y", initial)
	fade_out()
	
func fade_out():
	var tween = get_tree().create_tween().bind_node(overlay).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT).set_parallel(true)
	tween.tween_property(overlay.material, "shader_parameter/size_x", 0.001, seconds * 0.5)
	tween.tween_property(overlay.material, "shader_parameter/size_y", 0.001, seconds * 0.5)
	await tween.finished
	overlay.hide()
	
func fade_in():
	overlay.show()
	var tween = get_tree().create_tween().bind_node(overlay).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT).set_parallel(true)
	tween.tween_property(overlay.material, "shader_parameter/size_x", initial, seconds * 0.5)
	tween.tween_property(overlay.material, "shader_parameter/size_y", initial, seconds * 0.5)
	await tween.finished
