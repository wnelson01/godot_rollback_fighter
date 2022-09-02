class_name State
extends Node

func save_state() -> Dictionary:
	return {}

func load_state(state: Dictionary) -> void:
	pass
	
func interpolate_state(old_state: Dictionary, new_state: Dictionary, weight: float) -> void:
	pass
	
func get_local_input() -> Dictionary:
	return {}
	
func predict_remote_input(previous_input: Dictionary, ticks_since_real_input: int) -> Dictionary:
	return {}
	
func network_process(input: Dictionary) -> void:
	pass
	
func network_preprocess(input: Dictionary) -> void:
	pass
	
func network_postprocess(input: Dictionary) -> void:
	pass
