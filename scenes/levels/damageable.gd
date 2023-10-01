extends Node

class_name Damageable

signal on_damage(amount)
signal on_death

@export var target: Node2D
@export var health: int
var _currentHealth: int

func _ready():
	_currentHealth = health

func damage(amount: int):
	if _currentHealth == 0: return
	_currentHealth = clamp(_currentHealth - amount, 0, health)
	on_damage.emit(amount)
	if _currentHealth == 0: 
		on_death.emit()
		if target: Signals.on_global_death.emit(target)
