extends Area2D

class_name Weapon


var level = 1
var hp = 1
var attack_speed = 1
var speed = 100
var damage = 5
var knockback = 100
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO

func level_up():
	match level:
		1:
			hp = 1
			speed = 100
			attack_speed = 1
			damage = 5
			knockback = 100
			attack_size = 1.0

