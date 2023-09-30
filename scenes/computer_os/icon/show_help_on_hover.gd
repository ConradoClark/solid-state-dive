extends Node

@export var hoverSprite: HoverSprite
@export var help1: Label
@export var help2: Label
# Called when the node enters the scene tree for the first time.
func _ready():
	help1.hide()
	help2.hide()
	hoverSprite.on_hover.connect(_on_hover)
	hoverSprite.on_exit_hover.connect(_on_exit_hover)

func _on_hover():
	help1.show()
	help2.show()
	
func _on_exit_hover():
	help1.hide()
	help2.hide()
