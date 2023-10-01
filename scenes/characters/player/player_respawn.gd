extends Node

class_name PlayerRespawn

@export var target: CharacterBody2D
@export var damageable: Damageable
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.currentCheckpoint = target.global_position
	damageable.on_damage.connect(_on_damage)

func _on_damage(amount):
	Signals.on_player_respawn.emit()
	damageable._currentHealth = damageable.health
	target.hide()
	var tween = get_tree().create_tween()
	var time = 1 if (abs(target.global_position) - abs(Globals.currentCheckpoint)).length() > 5 else 0.25
	tween.tween_property(target, "position", Globals.currentCheckpoint, time)
	await tween.finished
	target.show()
