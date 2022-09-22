class_name FallingState
extends AirState

func network_process(input: Dictionary) -> void:
	owner.velocity.y += SGFixed.div(owner.fall_gravity, 1966080)
#	owner.velocity.y += owner.GRAVITY
	get_parent().network_process(input)
	
func network_postprocess(input: Dictionary) -> void:
	get_parent().network_postprocess(input)
