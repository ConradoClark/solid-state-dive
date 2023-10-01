extends Node

@export var clickable: Clickable
@export var sceneToLoad: String
@export var window: OSWindow
# Called when the node enters the scene tree for the first time.
func _ready():
	clickable.on_click.connect(_load_scene)

func _load_scene():
	Globals.changeScene(get_tree(), sceneToLoad)
	if window: window.opener.close_window()
