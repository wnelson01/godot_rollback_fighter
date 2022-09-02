extends State

func network_process(input: Dictionary) -> void:
	print(owner.speed)
	var input_vector := SGFixedVector2.new()
	input_vector.x = input.get("input_vector_x", int(0))
	input_vector.y = input.get("input_vector_y", int(0))
	if input_vector.x != 0 or input_vector.y != 0:
		if owner.speed < 16:
			owner.speed += 1
		#owner.position += input_vector * owner.speed
		input_vector.imul(owner.speed * 65536)
		owner.move_and_slide(input_vector)
	else:
		owner.speed = 0
	
	if input.get("drop_bomb", false):
		SyncManager.spawn("Bomb", get_parent(), owner.Bomb, { position = owner.global_position })
	
	if input.get("teleport", false):
		owner.position = Vector2(owner.rng.randi() % 1024, owner.rng.randi() % 600)
		owner.teleporting = true
	else:
		owner.teleporting = false
	owner.sync_to_physics_engine()
