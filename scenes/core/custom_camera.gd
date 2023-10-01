extends Camera2D

class_name CustomCamera

func shake(amount, duration):
	var tween = get_tree().create_tween()
	tween.tween_method(_set_camera_shake, amount, 0, duration)
	Globals.sceneTweenExclusives.push_back(tween)
	
func _set_camera_shake(s):
	set_offset(Vector2( \
		randf_range(-1.0, 1.0) * s, \
		randf_range(-1.0, 1.0) * s \
	))
