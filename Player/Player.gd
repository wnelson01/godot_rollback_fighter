extends SGKinematicBody2D

const SPEED = 196608
const GRAVITY = 32768
const JUMP = 65536 * 15

var velocity := SGFixedVector2.new()

const Bomb = preload("res://Bomb/Bomb.tscn")

onready var rng = $NetworkRandomNumberGenerator

var input_prefix := "player1_"

var speed := 0
var teleporting := false
