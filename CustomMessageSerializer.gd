extends "res://addons/godot-rollback-netcode/MessageSerializer.gd"

const input_path_mapping := {
	'/root/Main/ServerPlayer/StateMachine': 1,
	'/root/Main/ClientPlayer/StateMachine': 2,
}

enum HeaderFlags {
	HAS_INPUT_VECTOR = 1 << 0, # Bit 0
	DROP_BOMB        = 1 << 1, # Bit 1
	TELEPORT         = 1 << 2, # Bit 2
	JUMP				= 1 << 3,
}

var input_path_mapping_reverse := {}

func _init() -> void:
	for key in input_path_mapping:
		input_path_mapping_reverse[input_path_mapping[key]] = key

func serialize_input(all_input: Dictionary) -> PoolByteArray:
	var buffer := StreamPeerBuffer.new()
	buffer.resize(32)
	
	buffer.put_u32(all_input['$'])
	buffer.put_u8(all_input.size() - 1)
	for path in all_input:
		if path == '$':
			continue
		buffer.put_u8(input_path_mapping[path])
		
		var header := 0
		
		var input = all_input[path]
		if input.has('input_vector_x') or input.has('input_vector_y'):
			header |= HeaderFlags.HAS_INPUT_VECTOR
		if input.get('drop_bomb', false):
			header |= HeaderFlags.DROP_BOMB
		if input.get('teleport', false):
			header |= HeaderFlags.TELEPORT
		if input.get('jump', false):
			header |= HeaderFlags.JUMP
		
		buffer.put_u8(header)
		
		if input.has('input_vector_x'):
			var input_vector_x = input['input_vector_x']
			buffer.put_u64(input_vector_x)
		if input.has('input_vector_y'):
			var input_vector_y = input['input_vector_y']
			buffer.put_u64(input_vector_y)
	
	buffer.resize(buffer.get_position())
	return buffer.data_array

func unserialize_input(serialized: PoolByteArray) -> Dictionary:
	var buffer := StreamPeerBuffer.new()
	buffer.put_data(serialized)
	buffer.seek(0)
	
	var all_input := {}
	
	all_input['$'] = buffer.get_u32()
	
	var input_count = buffer.get_u8()
	if input_count == 0:
		return all_input
	
	var path = input_path_mapping_reverse[buffer.get_u8()]
	var input := {}
	
	var header = buffer.get_u8()
	if header & HeaderFlags.HAS_INPUT_VECTOR:
		input["input_vector_x"] = buffer.get_u64()
		input["input_vector_y"] = buffer.get_u64()
	if header & HeaderFlags.DROP_BOMB:
		input["drop_bomb"] = true
	if header & HeaderFlags.TELEPORT:
		input["teleport"] = true
	if header & HeaderFlags.JUMP:
		input['jump'] = true
	
	all_input[path] = input
	return all_input
