class_name FreeState
extends State

func network_process(input: Dictionary) -> void:
	owner.velocity = owner.move_and_slide(owner.velocity)
