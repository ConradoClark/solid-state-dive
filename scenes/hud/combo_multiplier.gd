extends Node

class_name ComboMultiplier

@export var comboCounter: ComboCounter
@export var label: Label

@export var color1: Color
@export var color2: Color
@export var color3: Color
@export var color4: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	label.hide()
	comboCounter.on_combo.connect(_on_combo)

func _on_combo(combo):
	Globals.currentCombo = combo
	if combo < 20 and Globals.currentMultiplier != 1: 
		label.hide()
		Globals.currentMultiplier = 1
	elif combo >= 20 and combo < 40 and Globals.currentMultiplier != 2:
		label.show()
		label.text = "x2"
		Globals.currentMultiplier = 2
		_effect20()
	elif combo >= 40 and Globals.currentMultiplier != 3:
		label.show()
		label.text = "x3"
		Globals.currentMultiplier = 3
		_effect40()

func _effect20():
	while Globals.currentCombo >= 20 and Globals.currentCombo < 40:
		label.label_settings.font_color = color1
		await get_tree().create_timer(0.25).timeout
		label.label_settings.font_color = color2
		await get_tree().create_timer(0.25).timeout

func _effect40():
	while Globals.currentCombo >= 40:
		label.label_settings.font_color = color1
		await get_tree().create_timer(0.1).timeout
		label.label_settings.font_color = color2
		await get_tree().create_timer(0.1).timeout
		label.label_settings.font_color = color3
		await get_tree().create_timer(0.1).timeout
		label.label_settings.font_color = color4
		await get_tree().create_timer(0.1).timeout
