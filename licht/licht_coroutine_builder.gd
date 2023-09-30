extends Resource

class_name LichtCoroutineBuilder

var LichtCoroutine = preload("licht_coroutine.gd")
var coroutine = LichtCoroutine.new()
var tree : SceneTree

func tween(tweenFn) -> LichtCoroutineBuilder:
	coroutine.add(func(): 
		var tween = tweenFn.call() 
		coroutine.tweens.push_back(tween)
		await tween.finished)
	return self

func waitFrame() -> LichtCoroutineBuilder:
	coroutine.add(func(): await tree.process_frame)
	return self
	
func waitSeconds(seconds) -> LichtCoroutineBuilder:
	coroutine.add(func(): await tree.create_timer(seconds).timeout)
	return self

func run(fn: Callable) -> LichtCoroutineBuilder:
	coroutine.add(func(): await fn.call())
	return self
	
func runAsync(fn: Callable) -> LichtCoroutineBuilder:
	coroutine.add(func(): await fn.call(coroutine.isInterrupted))
	return self
	
func breakIf(fn: Callable) -> LichtCoroutineBuilder:
	coroutine.breakIf = fn
	return self

func parallel(fns: Array[Callable]) -> LichtCoroutineBuilder:
	coroutine.add(func(): await Await.all(
		fns.map(func(fn): fn.call(coroutine.isInterrupted))))
	return self
	
func parallelTween(tweenFns: Array[Callable]) -> LichtCoroutineBuilder:
	coroutine.add(func(): 
		var allTweens = []
		for tweenFn in tweenFns:
			var tween = tweenFn.call() 
			coroutine.tweens.push_back(tween)
			allTweens.push_back(tween)
		var signals = allTweens.map(func(tween): return tween.finished)
		await Await.allSignals(signals))
	return self

func build():
	return coroutine as LichtCoroutine

func _init(tree=null):
	self.tree = tree
	coroutine.tree = tree
