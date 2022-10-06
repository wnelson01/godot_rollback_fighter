class_name FreeState
extends State

func network_process(input: Dictionary) -> void:
	owner.velocity = owner.move_and_slide(owner.velocity, owner.up_direction)
	if owner.velocity.x < 0:
		owner.fist.get_child(0).disabled = true
		owner.fist.get_child(0).visible = false
		owner.fist.get_child(1).disabled = false
		owner.fist.get_child(1).visible = true
	elif owner.velocity.x > 0:
		owner.fist.get_child(0).disabled = false
		owner.fist.get_child(0).visible = true
		owner.fist.get_child(1).disabled = true
		owner.fist.get_child(1).visible = false
	owner.fist.sync_to_physics_engine()
	if owner.fist.get_overlapping_body_count() != 0:
		print(owner.fist.get_overlapping_bodies())
	
func network_postprocess(input: Dictionary) -> void:
	pass
