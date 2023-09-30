extends Node

@export var clickable: Clickable
@export var sceneToLoad: PackedScene
@export var window: OSWindow
# Called when the node enters the scene tree for the first time.
func _ready():
	clickable.on_click.connect(_load_scene)

func _load_scene():
	get_tree().change_scene_to_packed(sceneToLoad)
	window.opener.close_window()
