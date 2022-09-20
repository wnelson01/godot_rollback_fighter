class_name StateMachine
extends Node

export(NodePath) var state

func set_state(new_state):
	state = new_state

func _ready() -> void:
	if state == null:
		state = get_node(get_child(0).get_path())
	else:
		state = get_node(state)

func _save_state() -> Dictionary:
	return {}

func _load_state(state: Dictionary) -> void:
	pass
	
func _interpolate_state(old_state: Dictionary, new_state: Dictionary, weight: float) -> void:
	pass
	
func _get_local_input() -> Dictionary:
	return {}
	
func _predict_remote_input(previous_input: Dictionary, ticks_since_real_input: int) -> Dictionary:
	return {}
	
func _network_process(input: Dictionary) -> void:
	pass
	
func _network_preprocess(input: Dictionary) -> void:
	pass
	
func _network_postprocess(input: Dictionary) -> void:
	pass
