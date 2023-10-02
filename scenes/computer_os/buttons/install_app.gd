extends Node

class_name InstallApp

@export var tag: String
@export var clickBehavior: AllowClickIfSpace
@export var clickable: Clickable
# Called when the node enters the scene tree for the first time.
func _ready():
	clickable.on_click.connect(_on_click)

func _on_click():
	Globals.acquiredApps[tag] = true
	Signals.on_app_install.emit(tag)
	Globals.totalSaved -= clickBehavior.requiredSpace
	Signals.total_saved_changed.emit()

