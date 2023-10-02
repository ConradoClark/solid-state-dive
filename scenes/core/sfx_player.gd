extends Node

class_name SfxPlayer

var jump_sfx: AudioStreamPlayer2D

func _ready():
	jump_sfx = get_node("jump_sfx")

func play_jump():
	jump_sfx.play()
	
