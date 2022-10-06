class_name AirState
extends FreeState

func network_process(input: Dictionary) -> void:
#	owner.velocity.y += owner.GRAVITY
	get_parent().network_process(input)

func network_postprocess(input: Dictionary) -> void:
	if owner.is_on_floor():
		self.emit_signal('change_state', 'Free/Ground')
	get_parent().network_postprocess(input)

