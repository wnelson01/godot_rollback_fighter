class_name AirState
extends FreeState

signal on_ground

func network_process(input: Dictionary) -> void:
	owner.velocity.y += owner.GRAVITY
	.network_process(input)

func network_postprocess(input: Dictionary) -> void:
	if owner.is_on_floor():
		emit_signal('change_state', 'Free/Ground')
	.network_postprocess(input)

