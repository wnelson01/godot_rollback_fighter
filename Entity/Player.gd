extends SGKinematicBody2D

const SPEED = 196608
const GRAVITY = 32768
const JUMP = 65536 * 15

export var jump_height: float
export var jump_time_to_peak: float
export var jump_time_to_descent: float

onready var jump_velocity := SGFixed.div(SGFixed.mul(131072, SGFixed.from_float(jump_height)), SGFixed.from_float(jump_time_to_peak))

onready var jump_gravity := SGFixed.mul(SGFixed.div(SGFixed.mul(-131072, SGFixed.from_float(jump_height)), SGFixed.mul(SGFixed.from_float(jump_time_to_peak), SGFixed.from_float(jump_time_to_peak))), -65536)

onready var fall_gravity := SGFixed.mul(SGFixed.div(SGFixed.mul(-131072, SGFixed.from_float(jump_height)), SGFixed.mul(SGFixed.from_float(jump_time_to_descent), SGFixed.from_float(jump_time_to_descent))), -65536)

var velocity := SGFixedVector2.new()
var up_direction := SGFixed.vector2(0, -65536)

const Bomb = preload("res://Bomb/Bomb.tscn")

onready var rng = $NetworkRandomNumberGenerator
onready var label = $Label
onready var state_machine = $StateMachine
onready var fist = $Fist

var input_prefix := "player1_"

var speed := 0
var teleporting := false

