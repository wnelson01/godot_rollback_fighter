class_name RisingState
extends AirState

func network_process(input: Dictionary) -> void:
	owner.velocity.y += SGFixed.div(owner.jump_gravity, 1966080)
#	owner.velocity.y += owner.GRAVITY
	get_parent().network_process(input)
	
func network_postprocess(input: Dictionary) -> void:
	if owner.velocity.y >= 0:
		self.emit_signal('change_state', 'Free/Air/Falling')
	get_parent().network_postprocess(input)
