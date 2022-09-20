extends SGKinematicBody2D

const SPEED = 196608
const GRAVITY = 32768
const JUMP = 65536 * 15

var velocity := SGFixedVector2.new()
var up_direction := SGFixed.vector2(0, -65536)

const Bomb = preload("res://Bomb/Bomb.tscn")

onready var rng = $NetworkRandomNumberGenerator
onready var label = $Label
onready var state_machine = $StateMachine

var input_prefix := "player1_"

var speed := 0
var teleporting := false

func _ready():
	state_machine.connect('on_ground', state_machine, '_on_Air_on_ground')
