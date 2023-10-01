extends Node

class_name TintFlash

@export var object: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	object.material = object.material.duplicate()

func flash(seconds: float, color: Color):
	var tween = get_tree().create_tween().bind_node(object).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(object.material, "shader_parameter/Flash", color, seconds * 0.5)
	tween.tween_property(object.material, "shader_parameter/Flash", Color.TRANSPARENT, seconds * 0.5)
