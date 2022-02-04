extends "res://addons/godot-rollback-netcode/MessageSerializer.gd"

func serialize_input(input: Dictionary) -> PoolByteArray:
	print (input)
	var bytes = var2bytes(input)
	print ("count: %s" % bytes.size())
	return bytes
