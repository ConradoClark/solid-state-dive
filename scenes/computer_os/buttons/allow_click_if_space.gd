extends Node

class_name AllowClickIfSpace

@export var requiredSpace: float
@export var tag: String
@export var disabler: ColorRect
@export var clickable: Clickable
@export var cost: Label
@export var gottenColor: Color
# Called when the node enters the scene tree for the first time.
func _ready():
	_update()

func _update():
	print(Globals.acquiredApps[tag])
	if Globals.acquiredApps[tag]:
		cost.text = "GOT"
		cost.label_settings = cost.label_settings.duplicate()
		cost.label_settings.font_color = gottenColor
	if Globals.acquiredApps[tag] or Globals.totalSaved < requiredSpace:
		disabler.show()
		clickable.preventClick = true
	else:
		disabler.hide()
		clickable.preventClick = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
