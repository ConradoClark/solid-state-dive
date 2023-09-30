extends Node

class_name LichtCoroutine

var coroutineDef = []
var tree : SceneTree
var breakIf: Callable
var runBreakIf: Callable
var tweens = []
var running = false
var interrupted = false

func add(fn):
	coroutineDef.push_back(fn)

func run(breakFn=null):
	if (breakFn): runBreakIf = breakFn
	running = true
	interrupted = false
	check()
	for action in coroutineDef:
		if (interrupted):
			return
		await action.call()

func runReverse(breakFn=null):
	var reversedDef = coroutineDef.duplicate()
	reversedDef.reverse()
	if (breakFn): runBreakIf = breakFn
	running = true
	interrupted = false
	check()
	for action in reversedDef:
		if (interrupted):
			return
		await action.call()

func check():
	while(running && !interrupted):
		if ((breakIf && breakIf.call()) || (runBreakIf && runBreakIf.call())) :
			for tween in tweens:
				tween.kill()
			tweens = []
			interrupted=true
		await tree.process_frame

func isInterrupted():
	return self.interrupted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
