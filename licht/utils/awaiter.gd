class_name Await

class MultipleAwaiter:
	signal all_completed()
	
	var _mask: int
	var _completed := false
	
	func _init(funcs: Array[Callable]) -> void:
		var size := funcs.size()
		assert(size < 64)
		_mask = (1 << size) - 1
		for i in size:
			_call_func(i, funcs[i])
	
	func _call_func(i: int, f: Callable) -> void:
		await f.call()
		_mask &= ~(1 << i)
		if not _mask and not _completed:
			_completed = true
			all_completed.emit()

static func all(funcs: Array[Callable]) -> void:
	await MultipleAwaiter.new(funcs).all_completed
	
static func allSignals(signals) -> void:
	for obj in signals:
		await obj
