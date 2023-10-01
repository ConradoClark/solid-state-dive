extends Node

class_name LevelCompleteMessage

@export var saved: Label
@export var text: Label
# Called when the node enters the scene tree for the first time.
func _ready():
	if !Globals.save[Globals.levelName]: return

	var savedOnLevel = snapped(Globals.save[Globals.levelName] \
		* (Globals.collectedOnLevel / float(Globals.dataObjectsAmount)), 0.01)
	
	Globals.totalSaved+= savedOnLevel
	saved.text = "{save} MB".format({"save": savedOnLevel})
	match Globals.levelName:
		"level1":
			text.text = "The files were temporary, just like your motivation."
		_:
			text.text = "oops"

