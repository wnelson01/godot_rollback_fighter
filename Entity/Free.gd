class_name FreeState
extends State

func network_process(input: Dictionary) -> void:
	owner.velocity = owner.move_and_slide(owner.velocity, owner.up_direction)
	owner.hit_box.sync_to_physics_engine()
	for area in owner.hit_box.get_overlapping_areas():
		print(area)
	
func network_postprocess(input: Dictionary) -> void:
	pass
