extends Node2D

onready var explosion_timer = $ExplosionTimer

func _network_spawn(data: Dictionary) -> void:
	global_position = data['position']
	explosion_timer.start()

func _on_ExplosionTimer_timeout() -> void:
	SyncManager.despawn(self)
