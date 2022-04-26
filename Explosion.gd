extends Node2D

onready var despawn_timer = $DespawnTimer
onready var animation_player = $NetworkAnimationPlayer

func _network_spawn(data: Dictionary) -> void:
	global_position = data['position']
	despawn_timer.start()
	animation_player.play("Explode")

func _on_DespawnTimer_timeout() -> void:
	SyncManager.despawn(self)
