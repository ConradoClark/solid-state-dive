extends Node

@export var label: Label
@export var danger: Color
@export var normal: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.total_saved_changed.connect(_update)
	_update()

func _update():
	label.text = "{total} MB free space in disk.".format({"total": Globals.totalSaved})
	label.label_settings.font_color = danger if Globals.totalSaved < 100 else normal
		
	
