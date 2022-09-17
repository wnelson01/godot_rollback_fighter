extends State

func network_process(input: Dictionary) -> void:
	owner.velocity.x = input.get("input_vector_x", int(0))
	owner.velocity.y = input.get("input_vector_y", int(0))
	if owner.velocity.x != 0 or owner.velocity.y != 0:
		if owner.speed < 16:
			owner.speed += 1
		owner.velocity.imul(owner.speed * 65536)
		owner.velocity = owner.move_and_slide(owner.velocity)
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
