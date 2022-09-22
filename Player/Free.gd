class_name FreeState
extends State

func network_process(input: Dictionary) -> void:
	owner.velocity = owner.move_and_slide(owner.velocity, owner.up_direction)
	.network_process(input)
	
func network_postprocess(input: Dictionary) -> void:
	.network_postprocess(input)
