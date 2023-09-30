extends Node2D

class_name OpenWinEffect

@export var origin: Vector2
@export var destination: Vector2

@export var smallSize: Vector2 = Vector2(5,5)
@export var fullSize: Vector2 = Vector2(160,140)

@export var initialColor: Color
@export var middleColor: Color
@export var endColor: Color

@export var panel: Panel

var _styleBox: StyleBoxFlat
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	_setup_stylebox()
	
func _setup_stylebox():
	_styleBox = panel.get_theme_stylebox("panel").duplicate()
	panel.add_theme_stylebox_override("panel", _styleBox)

func openWindow():
	show()
	await _win_anim().build().run()
	
func closeWindow():
	await  _win_anim().build().runReverse()
	await get_tree().create_timer(0.25).timeout
	queue_free()
	
func _win_anim() -> LichtCoroutineBuilder:
	return (LichtCoroutineBuilder.new(get_tree())
		.compose(func(builder): return addStep(0, initialColor, builder))
		.waitSeconds(0.25)
		.compose(func(builder): return addStep(0.25, initialColor, builder))
		.waitSeconds(0.20)
		.compose(func(builder): return addStep(0.50, middleColor, builder))
		.waitSeconds(0.175)
		.compose(func(builder): return addStep(0.75, middleColor, builder))
		.waitSeconds(0.15)
		.compose(func(builder): return addStep(1, endColor, builder))
	)

func addStep(step: float, color: Color, builder: LichtCoroutineBuilder) -> LichtCoroutineBuilder:
	return (builder
		.run(func(): 
			panel.size = lerp(smallSize, fullSize, step)
			var halfSize = panel.size / 2
			position = lerp(origin - halfSize, destination - halfSize, step)
			_styleBox.border_color = color
			)
	)
