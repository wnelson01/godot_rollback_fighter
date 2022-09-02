extends SGKinematicBody2D

const Bomb = preload("res://Bomb.tscn")

onready var rng = $NetworkRandomNumberGenerator

var input_prefix := "player1_"

var speed := 0
var teleporting := false
