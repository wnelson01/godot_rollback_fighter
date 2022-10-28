class_name FreeState
extends State

func network_process(input: Dictionary) -> void:
	owner.velocity = owner.move_and_slide(owner.velocity, owner.up_direction)
	if owner.hit_box.get_overlapping_body_count() != 0:
		print(owner.hit_box.get_overlapping_bodies())
	
func network_postprocess(input: Dictionary) -> void:
	pass
