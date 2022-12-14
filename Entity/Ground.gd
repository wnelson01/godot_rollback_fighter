class_name GroundState
extends FreeState

func network_process(input: Dictionary) -> void:
	owner.velocity.x = input.get("input_vector_x", int(0))
	owner.velocity.y = input.get("input_vector_y", int(0))
	if owner.velocity.x != 0 or owner.velocity.y != 0:
		if owner.speed < 16:
			owner.speed += 1
		owner.velocity.imul(owner.speed * 65536)
	else:
		owner.speed = 0
	
	if input.get("drop_bomb", false):
		SyncManager.spawn("Bomb", get_parent(), owner.Bomb, {
			position_x = owner.fixed_position.x,
			position_y = owner.fixed_position.y
		})
	
	if input.get("teleport", false):
		owner.position = Vector2(owner.rng.randi() % 1024, owner.rng.randi() % 600)
		owner.teleporting = true
	else:
		owner.teleporting = false

		
	if input.get("jump", false):
#		owner.velocity.y = -owner.JUMP
		owner.velocity.y = -owner.jump_velocity
		emit_signal('change_state', 'Free/Air/Rising')
		
	get_parent().network_process(input)
	
func network_postprocess(input: Dictionary) -> void:
#	if !owner.is_on_floor():
#		emit_signal('change_state', 'Free/Air/Falling')
	get_parent().network_postprocess(input)
