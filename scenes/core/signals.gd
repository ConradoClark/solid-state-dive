extends Node

signal window_opened(window)
signal close_window_pressed(window)

signal object_hit(object, source)

signal data_object_destroyed
signal trigger_object(tag)
signal on_global_death(object)
signal on_player_respawn

signal on_checkpoint(check)
signal on_scene_change()
signal total_saved_changed()
signal on_app_install(app)
signal on_weapon_change(index)
