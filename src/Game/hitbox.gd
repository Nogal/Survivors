extends Area2D

#@export var damage : int = 1
#@export_range (1, 1) var damage_range: int
@export var min_damage : int = 1
@export var max_damage : int = 2

@onready var collision = $CollisionShape2D
@onready var disable_timer = $Timer

func temp_disabled():
	collision.call_deferred("set", "disabled", true)
	disable_timer.start()

func _on_timer_timeout():
	collision.call_deferred("set", "disabled", false)
