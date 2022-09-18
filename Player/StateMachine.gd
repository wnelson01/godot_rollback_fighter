extends StateMachine

var input_prefix := "player1_"

func _save_state() -> Dictionary:
	return {
		speed = owner.speed,
		teleporting = owner.teleporting,
		fixed_position_x = owner.fixed_position.x,
		fixed_position_y = owner.fixed_position.y,
		velocity_x = owner.velocity.x,
		velocity_y = owner.velocity.y,
		state = state.get_path()
	}

func _load_state(state: Dictionary) -> void:
	owner.speed = state['speed']
	owner.teleporting = state['teleporting']
	owner.velocity.x = state['velocity_x']
	owner.velocity.y = state['velocity_y']
	owner.fixed_position.x = state['fixed_position_x']
	owner.fixed_position.y = state['fixed_position_y']
	owner.sync_to_physics_engine()
	self.state = get_node(state['state'])
	
func _interpolate_state(old_state: Dictionary, new_state: Dictionary, weight: float) -> void:
	pass
	
func _get_local_input() -> Dictionary:
	var input_vector := SGFixedVector2.new()
	input_vector.from_float(Input.get_vector(input_prefix + "left", input_prefix + "right", input_prefix + "up", input_prefix + "down").normalized())
	var input := {}
	if input_vector.x != 0 or input_vector.y != 0:
		input['input_vector_x'] = input_vector.x
		input['input_vector_y'] = input_vector.y
	if Input.is_action_just_pressed(input_prefix + "bomb"):
		input["drop_bomb"] = true
	if Input.is_action_just_pressed(input_prefix + "teleport"):
		input["teleport"] = true
	
	return input
	
func _predict_remote_input(previous_input: Dictionary, ticks_since_real_input: int) -> Dictionary:
	var input = previous_input.duplicate()
	input.erase("drop_bomb")
	if ticks_since_real_input > 2:
		input.erase("input_vector")
	return input
	
func _network_process(input: Dictionary) -> void:
	state.network_process(input)
	
func _network_preprocess(input: Dictionary) -> void:
	pass
	
func _network_postprocess(input: Dictionary) -> void:
	pass
