extends SGKinematicBody2D

onready var velocity := SGFixedVector2.new()


const Bomb = preload("res://Bomb/Bomb.tscn")

onready var rng = $NetworkRandomNumberGenerator

var input_prefix := "player1_"

var speed := 0
var teleporting := false
